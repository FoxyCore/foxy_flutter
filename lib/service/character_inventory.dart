import 'package:foxy/model/character_inventory.dart';
import 'package:foxy/service/service.dart';

class CharacterInventoryService with Service {
  final database =
      databases.where((element) => element.contains('characters')).first;

  Future<List<CharacterInventory>> getCharacterInventories(int guid) async {
    final columns = [
      'item as id',
      'itl.Name as name',
      'it.Quality as quality',
      'count',
      'didi.InventoryIcon_1 as icon'
    ];
    final columnClause = columns.join(', ');
    final tableClause = '$database.character_inventory as ci';
    final joins = [
      {'table': '$database.item_instance as ii', 'on': 'ci.item=ii.guid'},
      {'table': 'world.item_template as it', 'on': 'ii.itemEntry=it.entry'},
      {'table': 'world.item_template_locale as itl', 'on': 'it.entry=itl.ID'},
      {
        'table': 'foxy.dbc_item_display_info as didi',
        'on': 'it.displayid=didi.id'
      },
    ];
    final joinClause = joins.fold('', (previousValue, element) {
      return '$previousValue left join ${element['table']} on ${element['on']}';
    });
    final filters = ['ci.guid=$guid', 'ci.bag>0', 'itl.locale="zhCN"'];
    final whereClause = filters.join(' and ');
    const orderBy = 'it.Quality desc';
    final sql =
        'select $columnClause from $tableClause $joinClause where $whereClause order by $orderBy';
    var result = await pool.execute(sql);
    final characterInventories =
        result.rows.map((row) => CharacterInventory.fromJson(row.typedAssoc()));
    return characterInventories.toList();
  }
}

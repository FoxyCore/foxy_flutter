import 'package:foxy/model/area_table.dart';
import 'package:foxy/service/service.dart';

class AreaTableService with Service {
  final database = databases.where((element) => element.contains('foxy')).first;

  Future<List<AreaTable>> getAreaTables() async {
    final columns = ['ID', 'ContinentID', 'ParentAreaID', 'AreaName_Lang_zhCN'];
    final sql = 'select ${columns.join(', ')} from $database.dbc_area_table';
    var result = await pool.execute(sql);
    final areaTables =
        result.rows.map((row) => AreaTable.fromJson(row.typedAssoc()));
    return areaTables.toList();
  }
}

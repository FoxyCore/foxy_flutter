import 'package:foxy/model/character.dart';
import 'package:foxy/service/service.dart';

class CharacterService with Service {
  final database =
      databases.where((element) => element.contains('characters')).first;
  final table = 'characters';

  Future<List<Character>> getCharacters(int account) async {
    final columns = [
      'guid',
      'account',
      'name',
      'race',
      'class',
      'gender',
      'level',
      'map',
      'zone'
    ];
    final sql =
        'select ${columns.join(', ')} from $database.$table where account=$account';
    final result = await pool.execute(sql);
    final characters =
        result.rows.map((row) => Character.fromJson(row.typedAssoc()));
    return characters.toList();
  }
}

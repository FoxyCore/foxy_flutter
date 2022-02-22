import 'package:foxy_flutter/model/creature.dart';
import 'package:laconic/laconic.dart';

class CreatureTemplateService {
  QueryBuilder? _queryBuilder;

  CreatureTemplateService() {
    var database = Database(
      host: '127.0.0.1',
      port: 33060,
      database: 'acore_world',
      username: 'root',
      password: 'root',
    );
    _queryBuilder =
        QueryBuilder.from(database: database, table: 'creature_template');
  }

  search({
    int? entry,
    String? name,
    String? subname,
    int page = 1,
    int pageSize = 50,
  }) async {
    var rows = await _queryBuilder
        ?.select()
        .limit(pageSize)
        .skip((page - 1) * pageSize)
        .get();
    List<CreatureTemplate> creatureTemplates = [];
    rows?.forEach((row) {
      creatureTemplates.add(CreatureTemplate.from(row));
    });
    return creatureTemplates;
  }
}

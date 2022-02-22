import 'package:foxy_flutter/model/item.dart';
import 'package:laconic/laconic.dart';

class ItemTemplateService {
  QueryBuilder? _queryBuilder;

  ItemTemplateService() {
    var database = Database(
      host: '127.0.0.1',
      port: 33060,
      database: 'acore_world',
      username: 'root',
      password: 'root',
    );
    _queryBuilder =
        QueryBuilder.from(database: database, table: 'item_template');
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
    List<ItemTemplate> itemTemplates = [];
    rows?.forEach((row) {
      itemTemplates.add(ItemTemplate.from(row));
    });
    return itemTemplates;
  }
}

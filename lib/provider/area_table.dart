import 'package:foxy/model/area_table.dart';
import 'package:foxy/service/area_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'area_table.g.dart';

@riverpod
class AreaTablesNotifier extends _$AreaTablesNotifier {
  @override
  Future<List<AreaTable>> build() async {
    final service = AreaTableService();
    return await service.getAreaTables();
  }
}

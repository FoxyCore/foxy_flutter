import 'package:foxy/model/character_inventory.dart';
import 'package:foxy/provider/character.dart';
import 'package:foxy/service/character_inventory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_inventory.g.dart';

@riverpod
class CharacterInventoriesNotifier extends _$CharacterInventoriesNotifier {
  @override
  Future<List<CharacterInventory>> build() async {
    final character = await ref.watch(characterNotifierProvider.future);
    final service = CharacterInventoryService();
    return await service.getCharacterInventories(character.guid);
  }
}

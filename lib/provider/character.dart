import 'package:foxy/model/character.dart';
import 'package:foxy/provider/account.dart';
import 'package:foxy/service/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character.g.dart';

@riverpod
class CharactersNotifier extends _$CharactersNotifier {
  @override
  Future<List<Character>> build() async {
    final account = await ref.watch(accountNotifierProvider.future);
    final service = CharacterService();
    return await service.getCharacters(account.id);
  }
}

@riverpod
class CharacterNotifier extends _$CharacterNotifier {
  @override
  Future<Character> build() async {
    return Character();
  }

  Future<void> link(int guid) async {
    final characters = await ref.read(charactersNotifierProvider.future);
    final character = characters.where((element) => element.guid == guid).first;
    state = AsyncData(character);
  }
}

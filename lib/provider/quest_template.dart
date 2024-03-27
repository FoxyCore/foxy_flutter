import 'package:foxy/model/quest_template.dart';
import 'package:foxy/provider/character.dart';
import 'package:foxy/service/quest_template.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quest_template.g.dart';

@riverpod
class ActiveQuestsNotifier extends _$ActiveQuestsNotifier {
  @override
  Future<List<QuestTemplate>> build() async {
    final character = await ref.watch(characterNotifierProvider.future);
    final service = QuestTemplateService();
    return await service.getActiveQuests(character.guid);
  }
}

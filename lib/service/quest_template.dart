import 'package:foxy/model/quest_template.dart';
import 'package:foxy/service/character.dart';
import 'package:foxy/service/service.dart';

class QuestTemplateService with Service {
  final database =
      databases.where((element) => element.contains('world')).first;

  Future<List<QuestTemplate>> getActiveQuests(int guid) async {
    final characterService = CharacterService();
    final characterDatabase = characterService.database;
    final columns = ['qt.ID', 'qt.QuestLevel', 'qtl.Title', 'qtl.Objectives'];
    final sql =
        'select ${columns.join(', ')} from $characterDatabase.character_queststatus as cq  left join $database.quest_template as qt on cq.quest = qt.ID left join $database.quest_template_locale as qtl on qt.ID = qtl.ID where guid=$guid and qtl.locale = "zhCN"';
    var result = await pool.execute(sql);
    final questTemplates =
        result.rows.map((row) => QuestTemplate.fromJson(row.typedAssoc()));
    return questTemplates.toList();
  }
}

class QuestTemplate {
  int id = 0;
  int questLevel = 0;
  String title = '';
  String objectives = '';

  QuestTemplate();

  QuestTemplate.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    questLevel = json['QuestLevel'];
    title = json['Title'];
    objectives = json['Objectives'];
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'QuestLevel': questLevel,
      'Title': title,
      'Objectives': objectives
    };
  }
}

class Character {
  int guid = 0;
  int account = 0;
  String name = '';
  int race = 0;
  int gameClass = 0;
  int gender = 0;
  int level = 0;
  int map = 0;
  int zone = 0;

  Character();

  Character.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    name = json['name'];
    race = json['race'];
    gameClass = json['class'];
    gender = json['gender'];
    level = json['level'];
    guid = json['guid'];
    map = json['map'];
    zone = json['zone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'name': name,
      'race': race,
      'class': gameClass,
      'gender': gender,
      'level': level,
      'guid': guid,
      'map': map,
      'zone': zone
    };
  }
}

class CharacterInventory {
  int id = 0;
  String name = '';
  int quality = 0;
  int count = 0;
  String icon = '';

  CharacterInventory();

  CharacterInventory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quality = json['quality'];
    count = json['count'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quality': quality,
      'count': count,
      'icon': icon
    };
  }
}

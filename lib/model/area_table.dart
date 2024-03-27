class AreaTable {
  int id = 0;
  int continentId = 0;
  int parentAreaId = 0;
  String areaNameLangZhCN = '';

  AreaTable();

  AreaTable.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    continentId = json['ContinentID'];
    parentAreaId = json['ParentAreaID'];
    areaNameLangZhCN = json['AreaName_Lang_zhCN'];
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'ContinentID': continentId,
      'ParentAreaID': parentAreaId,
      'AreaName_Lang_zhCN': areaNameLangZhCN
    };
  }
}

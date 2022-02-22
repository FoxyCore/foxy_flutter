// ignore_for_file: non_constant_identifier_names

class ItemTemplate {
  late int entry;
  late int Class; // 数据库中字段名为class，避免关键字冲突而使用Class
  late int subclass;
  late int SoundOverrideSubclass;
  String? name;
  late int displayid;
  late int Quality;
  late int Flags;
  late int FlagsExtra;
  late int BuyCount;
  late int BuyPrice;
  late int SellPrice;
  late int InventoryType;
  late int AllowableClass;
  late int AllowableRace;
  late int ItemLevel;
  late int RequiredLevel;
  late int RequiredSkill;
  late int RequiredSkillRank;
  late int requiredspell;
  late int requiredhonorrank;
  late int RequiredCityRank;
  late int RequiredReputationFaction;
  late int RequiredReputationRank;
  late int maxcount;
  late int stackable;
  late int ContainerSlots;
  late int StatsCount;
  late int stat_type1;
  late int stat_value1;
  late int stat_type2;
  late int stat_value2;
  late int stat_type3;
  late int stat_value3;
  late int stat_type4;
  late int stat_value4;
  late int stat_type5;
  late int stat_value5;
  late int stat_type6;
  late int stat_value6;
  late int stat_type7;
  late int stat_value7;
  late int stat_type8;
  late int stat_value8;
  late int stat_type9;
  late int stat_value9;
  late int stat_type10;
  late int stat_value10;
  late int ScalingStatDistribution;
  late int ScalingStatValue;
  late double dmg_min1;
  late double dmg_max1;
  late int dmg_type1;
  late double dmg_min2;
  late double dmg_max2;
  late int dmg_type2;
  late int armor;
  late int holy_res;
  late int fire_res;
  late int nature_res;
  late int frost_res;
  late int shadow_res;
  late int arcane_res;
  late int delay;
  late int ammo_type;
  late double RangedModRange;
  late int spellid_1;
  late int spelltrigger_1;
  late int spellcharges_1;
  late double spellppmRate_1;
  late int spellcooldown_1;
  late int spellcategory_1;
  late int spellcategorycooldown_1;
  late int spellid_2;
  late int spelltrigger_2;
  late int spellcharges_2;
  late double spellppmRate_2;
  late int spellcooldown_2;
  late int spellcategory_2;
  late int spellcategorycooldown_2;
  late int spellid_3;
  late int spelltrigger_3;
  late int spellcharges_3;
  late double spellppmRate_3;
  late int spellcooldown_3;
  late int spellcategory_3;
  late int spellcategorycooldown_3;
  late int spellid_4;
  late int spelltrigger_4;
  late int spellcharges_4;
  late double spellppmRate_4;
  late int spellcooldown_4;
  late int spellcategory_4;
  late int spellcategorycooldown_4;
  late int spellid_5;
  late int spelltrigger_5;
  late int spellcharges_5;
  late double spellppmRate_5;
  late int spellcooldown_5;
  late int spellcategory_5;
  late int spellcategorycooldown_5;
  late int bonding;
  String? description;
  late int PageText;
  late int LanguageID;
  late int PageMaterial;
  late int startquest;
  late int lockid;
  late int Material;
  late int sheath;
  late int RandomProperty;
  late int RandomSuffix;
  late int block;
  late int itemset;
  late int MaxDurability;
  late int area;
  late int map; // 数据库中字段名为Map，避免关键字冲突而使用map
  late int BagFamily;
  late int TotemCategory;
  late int socketColor_1;
  late int socketContent_1;
  late int socketColor_2;
  late int socketContent_2;
  late int socketColor_3;
  late int socketContent_3;
  late int socketBonus;
  late int GemProperties;
  late int RequiredDisenchantSkill;
  late double ArmorDamageModifier;
  late int duration;
  late int ItemLimitCategory;
  late int HolidayId;
  String? ScriptName;
  late int DisenchantID;
  late int FoodType;
  late int minMoneyLoot;
  late int maxMoneyLoot;
  late int flagsCustom;
  late int VerifiedBuild;

  ItemTemplate({
    required this.entry,
    required this.Class,
    required this.subclass,
    required this.SoundOverrideSubclass,
    this.name,
    required this.displayid,
    required this.Quality,
    required this.Flags,
    required this.FlagsExtra,
    required this.BuyCount,
    required this.BuyPrice,
    required this.SellPrice,
    required this.InventoryType,
    required this.AllowableClass,
    required this.AllowableRace,
    required this.ItemLevel,
    required this.RequiredLevel,
    required this.RequiredSkill,
    required this.RequiredSkillRank,
    required this.requiredspell,
    required this.requiredhonorrank,
    required this.RequiredCityRank,
    required this.RequiredReputationFaction,
    required this.RequiredReputationRank,
    required this.maxcount,
    required this.stackable,
    required this.ContainerSlots,
    required this.StatsCount,
    required this.stat_type1,
    required this.stat_value1,
    required this.stat_type2,
    required this.stat_value2,
    required this.stat_type3,
    required this.stat_value3,
    required this.stat_type4,
    required this.stat_value4,
    required this.stat_type5,
    required this.stat_value5,
    required this.stat_type6,
    required this.stat_value6,
    required this.stat_type7,
    required this.stat_value7,
    required this.stat_type8,
    required this.stat_value8,
    required this.stat_type9,
    required this.stat_value9,
    required this.stat_type10,
    required this.stat_value10,
    required this.ScalingStatDistribution,
    required this.ScalingStatValue,
    required this.dmg_min1,
    required this.dmg_max1,
    required this.dmg_type1,
    required this.dmg_min2,
    required this.dmg_max2,
    required this.dmg_type2,
    required this.armor,
    required this.holy_res,
    required this.fire_res,
    required this.nature_res,
    required this.frost_res,
    required this.shadow_res,
    required this.arcane_res,
    required this.delay,
    required this.ammo_type,
    required this.RangedModRange,
    required this.spellid_1,
    required this.spelltrigger_1,
    required this.spellcharges_1,
    required this.spellppmRate_1,
    required this.spellcooldown_1,
    required this.spellcategory_1,
    required this.spellcategorycooldown_1,
    required this.spellid_2,
    required this.spelltrigger_2,
    required this.spellcharges_2,
    required this.spellppmRate_2,
    required this.spellcooldown_2,
    required this.spellcategory_2,
    required this.spellcategorycooldown_2,
    required this.spellid_3,
    required this.spelltrigger_3,
    required this.spellcharges_3,
    required this.spellppmRate_3,
    required this.spellcooldown_3,
    required this.spellcategory_3,
    required this.spellcategorycooldown_3,
    required this.spellid_4,
    required this.spelltrigger_4,
    required this.spellcharges_4,
    required this.spellppmRate_4,
    required this.spellcooldown_4,
    required this.spellcategory_4,
    required this.spellcategorycooldown_4,
    required this.spellid_5,
    required this.spelltrigger_5,
    required this.spellcharges_5,
    required this.spellppmRate_5,
    required this.spellcooldown_5,
    required this.spellcategory_5,
    required this.spellcategorycooldown_5,
    required this.bonding,
    this.description,
    required this.PageText,
    required this.LanguageID,
    required this.PageMaterial,
    required this.startquest,
    required this.lockid,
    required this.Material,
    required this.sheath,
    required this.RandomProperty,
    required this.RandomSuffix,
    required this.block,
    required this.itemset,
    required this.MaxDurability,
    required this.area,
    required this.map,
    required this.BagFamily,
    required this.TotemCategory,
    required this.socketColor_1,
    required this.socketContent_1,
    required this.socketColor_2,
    required this.socketContent_2,
    required this.socketColor_3,
    required this.socketContent_3,
    required this.socketBonus,
    required this.GemProperties,
    required this.RequiredDisenchantSkill,
    required this.ArmorDamageModifier,
    required this.duration,
    required this.ItemLimitCategory,
    required this.HolidayId,
    this.ScriptName,
    required this.DisenchantID,
    required this.FoodType,
    required this.minMoneyLoot,
    required this.maxMoneyLoot,
    required this.flagsCustom,
    required this.VerifiedBuild,
  });

  ItemTemplate.from(Map<String, dynamic> json) {
    entry = json['entry'];
    Class = json['class'];
    subclass = json['subclass'];
    SoundOverrideSubclass = json['SoundOverrideSubclass'];
    name = json['name'];
    displayid = json['displayid'];
    Quality = json['Quality'];
    Flags = json['Flags'];
    FlagsExtra = json['FlagsExtra'];
    BuyCount = json['BuyCount'];
    BuyPrice = json['BuyPrice'];
    SellPrice = json['SellPrice'];
    InventoryType = json['InventoryType'];
    AllowableClass = json['AllowableClass'];
    AllowableRace = json['AllowableRace'];
    ItemLevel = json['ItemLevel'];
    RequiredLevel = json['RequiredLevel'];
    RequiredSkill = json['RequiredSkill'];
    RequiredSkillRank = json['RequiredSkillRank'];
    requiredspell = json['requiredspell'];
    requiredhonorrank = json['requiredhonorrank'];
    RequiredCityRank = json['RequiredCityRank'];
    RequiredReputationFaction = json['RequiredReputationFaction'];
    RequiredReputationRank = json['RequiredReputationRank'];
    maxcount = json['maxcount'];
    stackable = json['stackable'];
    ContainerSlots = json['ContainerSlots'];
    StatsCount = json['StatsCount'];
    stat_type1 = json['stat_type1'];
    stat_value1 = json['stat_value1'];
    stat_type2 = json['stat_type2'];
    stat_value2 = json['stat_value2'];
    stat_type3 = json['stat_type3'];
    stat_value3 = json['stat_value3'];
    stat_type4 = json['stat_type4'];
    stat_value4 = json['stat_value4'];
    stat_type5 = json['stat_type5'];
    stat_value5 = json['stat_value5'];
    stat_type6 = json['stat_type6'];
    stat_value6 = json['stat_value6'];
    stat_type7 = json['stat_type7'];
    stat_value7 = json['stat_value7'];
    stat_type8 = json['stat_type8'];
    stat_value8 = json['stat_value8'];
    stat_type9 = json['stat_type9'];
    stat_value9 = json['stat_value9'];
    stat_type10 = json['stat_type10'];
    stat_value10 = json['stat_value10'];
    ScalingStatDistribution = json['ScalingStatDistribution'];
    ScalingStatValue = json['ScalingStatValue'];
    dmg_min1 = json['dmg_min1'];
    dmg_max1 = json['dmg_max1'];
    dmg_type1 = json['dmg_type1'];
    dmg_min2 = json['dmg_min2'];
    dmg_max2 = json['dmg_max2'];
    dmg_type2 = json['dmg_type2'];
    armor = json['armor'];
    holy_res = json['holy_res'];
    fire_res = json['fire_res'];
    nature_res = json['nature_res'];
    frost_res = json['frost_res'];
    shadow_res = json['shadow_res'];
    arcane_res = json['arcane_res'];
    delay = json['delay'];
    ammo_type = json['ammo_type'];
    RangedModRange = json['RangedModRange'];
    spellid_1 = json['spellid_1'];
    spelltrigger_1 = json['spelltrigger_1'];
    spellcharges_1 = json['spellcharges_1'];
    spellppmRate_1 = json['spellppmRate_1'];
    spellcooldown_1 = json['spellcooldown_1'];
    spellcategory_1 = json['spellcategory_1'];
    spellcategorycooldown_1 = json['spellcategorycooldown_1'];
    spellid_2 = json['spellid_2'];
    spelltrigger_2 = json['spelltrigger_2'];
    spellcharges_2 = json['spellcharges_2'];
    spellppmRate_2 = json['spellppmRate_2'];
    spellcooldown_2 = json['spellcooldown_2'];
    spellcategory_2 = json['spellcategory_2'];
    spellcategorycooldown_2 = json['spellcategorycooldown_2'];
    spellid_3 = json['spellid_3'];
    spelltrigger_3 = json['spelltrigger_3'];
    spellcharges_3 = json['spellcharges_3'];
    spellppmRate_3 = json['spellppmRate_3'];
    spellcooldown_3 = json['spellcooldown_3'];
    spellcategory_3 = json['spellcategory_3'];
    spellcategorycooldown_3 = json['spellcategorycooldown_3'];
    spellid_4 = json['spellid_4'];
    spelltrigger_4 = json['spelltrigger_4'];
    spellcharges_4 = json['spellcharges_4'];
    spellppmRate_4 = json['spellppmRate_4'];
    spellcooldown_4 = json['spellcooldown_4'];
    spellcategory_4 = json['spellcategory_4'];
    spellcategorycooldown_4 = json['spellcategorycooldown_4'];
    spellid_5 = json['spellid_5'];
    spelltrigger_5 = json['spelltrigger_5'];
    spellcharges_5 = json['spellcharges_5'];
    spellppmRate_5 = json['spellppmRate_5'];
    spellcooldown_5 = json['spellcooldown_5'];
    spellcategory_5 = json['spellcategory_5'];
    spellcategorycooldown_5 = json['spellcategorycooldown_5'];
    bonding = json['bonding'];
    description = json['description'];
    PageText = json['PageText'];
    LanguageID = json['LanguageID'];
    PageMaterial = json['PageMaterial'];
    startquest = json['startquest'];
    lockid = json['lockid'];
    Material = json['Material'];
    sheath = json['sheath'];
    RandomProperty = json['RandomProperty'];
    RandomSuffix = json['RandomSuffix'];
    block = json['block'];
    itemset = json['itemset'];
    MaxDurability = json['MaxDurability'];
    area = json['area'];
    map = json['Map'];
    BagFamily = json['BagFamily'];
    TotemCategory = json['TotemCategory'];
    socketColor_1 = json['socketColor_1'];
    socketContent_1 = json['socketContent_1'];
    socketColor_2 = json['socketColor_2'];
    socketContent_2 = json['socketContent_2'];
    socketColor_3 = json['socketColor_3'];
    socketContent_3 = json['socketContent_3'];
    socketBonus = json['socketBonus'];
    GemProperties = json['GemProperties'];
    RequiredDisenchantSkill = json['RequiredDisenchantSkill'];
    ArmorDamageModifier = json['ArmorDamageModifier'];
    duration = json['duration'];
    ItemLimitCategory = json['ItemLimitCategory'];
    HolidayId = json['HolidayId'];
    ScriptName = json['ScriptName'];
    DisenchantID = json['DisenchantID'];
    FoodType = json['FoodType'];
    minMoneyLoot = json['minMoneyLoot'];
    maxMoneyLoot = json['maxMoneyLoot'];
    flagsCustom = json['flagsCustom'];
    VerifiedBuild = json['VerifiedBuild'];
  }

  Map<String, String> toJson() {
    return {
      'entry': entry.toString(),
      'class': Class.toString(),
      'subclass': subclass.toString(),
      'SoundOverrideSubclass': SoundOverrideSubclass.toString(),
      'name': name.toString(),
      'displayid': displayid.toString(),
      'Quality': Quality.toString(),
      'Flags': Flags.toString(),
      'FlagsExtra': FlagsExtra.toString(),
      'BuyCount': BuyCount.toString(),
      'BuyPrice': BuyPrice.toString(),
      'SellPrice': SellPrice.toString(),
      'InventoryType': InventoryType.toString(),
      'AllowableClass': AllowableClass.toString(),
      'AllowableRace': AllowableRace.toString(),
      'ItemLevel': ItemLevel.toString(),
      'RequiredLevel': RequiredLevel.toString(),
      'RequiredSkill': RequiredSkill.toString(),
      'RequiredSkillRank': RequiredSkillRank.toString(),
      'requiredspell': requiredspell.toString(),
      'requiredhonorrank': requiredhonorrank.toString(),
      'RequiredCityRank': RequiredCityRank.toString(),
      'RequiredReputationFaction': RequiredReputationFaction.toString(),
      'RequiredReputationRank': RequiredReputationRank.toString(),
      'maxcount': maxcount.toString(),
      'stackable': stackable.toString(),
      'ContainerSlots': ContainerSlots.toString(),
      'StatsCount': StatsCount.toString(),
      'stat_type1': stat_type1.toString(),
      'stat_value1': stat_value1.toString(),
      'stat_type2': stat_type2.toString(),
      'stat_value2': stat_value2.toString(),
      'stat_type3': stat_type3.toString(),
      'stat_value3': stat_value3.toString(),
      'stat_type4': stat_type4.toString(),
      'stat_value4': stat_value4.toString(),
      'stat_type5': stat_type5.toString(),
      'stat_value5': stat_value5.toString(),
      'stat_type6': stat_type6.toString(),
      'stat_value6': stat_value6.toString(),
      'stat_type7': stat_type7.toString(),
      'stat_value7': stat_value7.toString(),
      'stat_type8': stat_type8.toString(),
      'stat_value8': stat_value8.toString(),
      'stat_type9': stat_type9.toString(),
      'stat_value9': stat_value9.toString(),
      'stat_type10': stat_type10.toString(),
      'stat_value10': stat_value10.toString(),
      'ScalingStatDistribution': ScalingStatDistribution.toString(),
      'ScalingStatValue': ScalingStatValue.toString(),
      'dmg_min1': dmg_min1.toString(),
      'dmg_max1': dmg_max1.toString(),
      'dmg_type1': dmg_type1.toString(),
      'dmg_min2': dmg_min2.toString(),
      'dmg_max2': dmg_max2.toString(),
      'dmg_type2': dmg_type2.toString(),
      'armor': armor.toString(),
      'holy_res': holy_res.toString(),
      'fire_res': fire_res.toString(),
      'nature_res': nature_res.toString(),
      'frost_res': frost_res.toString(),
      'shadow_res': shadow_res.toString(),
      'arcane_res': arcane_res.toString(),
      'delay': delay.toString(),
      'ammo_type': ammo_type.toString(),
      'RangedModRange': RangedModRange.toString(),
      'spellid_1': spellid_1.toString(),
      'spelltrigger_1': spelltrigger_1.toString(),
      'spellcharges_1': spellcharges_1.toString(),
      'spellppmRate_1': spellppmRate_1.toString(),
      'spellcooldown_1': spellcooldown_1.toString(),
      'spellcategory_1': spellcategory_1.toString(),
      'spellcategorycooldown_1': spellcategorycooldown_1.toString(),
      'spellid_2': spellid_2.toString(),
      'spelltrigger_2': spelltrigger_2.toString(),
      'spellcharges_2': spellcharges_2.toString(),
      'spellppmRate_2': spellppmRate_2.toString(),
      'spellcooldown_2': spellcooldown_2.toString(),
      'spellcategory_2': spellcategory_2.toString(),
      'spellcategorycooldown_2': spellcategorycooldown_2.toString(),
      'spellid_3': spellid_3.toString(),
      'spelltrigger_3': spelltrigger_3.toString(),
      'spellcharges_3': spellcharges_3.toString(),
      'spellppmRate_3': spellppmRate_3.toString(),
      'spellcooldown_3': spellcooldown_3.toString(),
      'spellcategory_3': spellcategory_3.toString(),
      'spellcategorycooldown_3': spellcategorycooldown_3.toString(),
      'spellid_4': spellid_4.toString(),
      'spelltrigger_4': spelltrigger_4.toString(),
      'spellcharges_4': spellcharges_4.toString(),
      'spellppmRate_4': spellppmRate_4.toString(),
      'spellcooldown_4': spellcooldown_4.toString(),
      'spellcategory_4': spellcategory_4.toString(),
      'spellcategorycooldown_4': spellcategorycooldown_4.toString(),
      'spellid_5': spellid_5.toString(),
      'spelltrigger_5': spelltrigger_5.toString(),
      'spellcharges_5': spellcharges_5.toString(),
      'spellppmRate_5': spellppmRate_5.toString(),
      'spellcooldown_5': spellcooldown_5.toString(),
      'spellcategory_5': spellcategory_5.toString(),
      'spellcategorycooldown_5': spellcategorycooldown_5.toString(),
      'bonding': bonding.toString(),
      'description': description.toString(),
      'PageText': PageText.toString(),
      'LanguageID': LanguageID.toString(),
      'PageMaterial': PageMaterial.toString(),
      'startquest': startquest.toString(),
      'lockid': lockid.toString(),
      'Material': Material.toString(),
      'sheath': sheath.toString(),
      'RandomProperty': RandomProperty.toString(),
      'RandomSuffix': RandomSuffix.toString(),
      'block': block.toString(),
      'itemset': itemset.toString(),
      'MaxDurability': MaxDurability.toString(),
      'area': area.toString(),
      'Map': map.toString(),
      'BagFamily': BagFamily.toString(),
      'TotemCategory': TotemCategory.toString(),
      'socketColor_1': socketColor_1.toString(),
      'socketContent_1': socketContent_1.toString(),
      'socketColor_2': socketColor_2.toString(),
      'socketContent_2': socketContent_2.toString(),
      'socketColor_3': socketColor_3.toString(),
      'socketContent_3': socketContent_3.toString(),
      'socketBonus': socketBonus.toString(),
      'GemProperties': GemProperties.toString(),
      'RequiredDisenchantSkill': RequiredDisenchantSkill.toString(),
      'ArmorDamageModifier': ArmorDamageModifier.toString(),
      'duration': duration.toString(),
      'ItemLimitCategory': ItemLimitCategory.toString(),
      'HolidayId': HolidayId.toString(),
      'ScriptName': ScriptName.toString(),
      'DisenchantID': DisenchantID.toString(),
      'FoodType': FoodType.toString(),
      'minMoneyLoot': minMoneyLoot.toString(),
      'maxMoneyLoot': maxMoneyLoot.toString(),
      'flagsCustom': flagsCustom.toString(),
      'VerifiedBuild': VerifiedBuild.toString(),
    };
  }
}

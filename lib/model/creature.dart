// ignore_for_file: non_constant_identifier_names

class CreatureTemplate {
  late int entry;
  late int difficulty_entry_1;
  late int difficulty_entry_2;
  late int difficulty_entry_3;
  late int KillCredit1;
  late int KillCredit2;
  late int modelid1;
  late int modelid2;
  late int modelid3;
  late int modelid4;
  String? name;
  String? subname;
  String? IconName;
  late int gossip_menu_id;
  late int minlevel;
  late int maxlevel;
  late int exp;
  late int faction;
  late int npcflag;
  late double speed_walk;
  late double speed_run;
  late double speed_swim;
  late double speed_flight;
  late double detection_range;
  late double scale;
  late int rank;
  late int dmgschool;
  late double DamageModifier;
  late int BaseAttackTime;
  late int RangeAttackTime;
  late double BaseVariance;
  late double RangeVariance;
  late int unit_class;
  late int unit_flags;
  late int unit_flags2;
  late int dynamicflags;
  late int family;
  late int trainer_type;
  late int trainer_spell;
  late int trainer_class;
  late int trainer_race;
  late int type;
  late int type_flags;
  late int lootid;
  late int pickpocketloot;
  late int skinloot;
  late int PetSpellDataId;
  late int VehicleId;
  late int mingold;
  late int maxgold;
  late String AIName;
  late int MovementType;
  late double HoverHeight;
  late double HealthModifier;
  late double ManaModifier;
  late double ArmorModifier;
  late double ExperienceModifier;
  late int RacialLeader;
  late int movementId;
  late int RegenHealth;
  late int mechanic_immune_mask;
  late int spell_school_immune_mask;
  late int flags_extra;
  String? ScriptName;
  late int VerifiedBuild;

  CreatureTemplate({
    required this.entry,
    required this.difficulty_entry_1,
    required this.difficulty_entry_2,
    required this.difficulty_entry_3,
    required this.KillCredit1,
    required this.KillCredit2,
    required this.modelid1,
    required this.modelid2,
    required this.modelid3,
    required this.modelid4,
    this.name,
    this.subname,
    this.IconName,
    required this.gossip_menu_id,
    required this.minlevel,
    required this.maxlevel,
    required this.exp,
    required this.faction,
    required this.npcflag,
    required this.speed_walk,
    required this.speed_run,
    required this.speed_swim,
    required this.speed_flight,
    required this.detection_range,
    required this.scale,
    required this.rank,
    required this.dmgschool,
    required this.DamageModifier,
    required this.BaseAttackTime,
    required this.RangeAttackTime,
    required this.BaseVariance,
    required this.RangeVariance,
    required this.unit_class,
    required this.unit_flags,
    required this.unit_flags2,
    required this.dynamicflags,
    required this.family,
    required this.trainer_type,
    required this.trainer_spell,
    required this.trainer_class,
    required this.trainer_race,
    required this.type,
    required this.type_flags,
    required this.lootid,
    required this.pickpocketloot,
    required this.skinloot,
    required this.PetSpellDataId,
    required this.VehicleId,
    required this.mingold,
    required this.maxgold,
    required this.AIName,
    required this.MovementType,
    required this.HoverHeight,
    required this.HealthModifier,
    required this.ManaModifier,
    required this.ArmorModifier,
    required this.ExperienceModifier,
    required this.RacialLeader,
    required this.movementId,
    required this.RegenHealth,
    required this.mechanic_immune_mask,
    required this.spell_school_immune_mask,
    required this.flags_extra,
    this.ScriptName,
    required this.VerifiedBuild,
  });

  CreatureTemplate.from(Map<String, dynamic> json) {
    entry = json['entry'];
    difficulty_entry_1 = json['difficulty_entry_1'];
    difficulty_entry_2 = json['difficulty_entry_2'];
    difficulty_entry_3 = json['difficulty_entry_3'];
    KillCredit1 = json['KillCredit1'];
    KillCredit2 = json['KillCredit2'];
    modelid1 = json['modelid1'];
    modelid2 = json['modelid2'];
    modelid3 = json['modelid3'];
    modelid4 = json['modelid4'];
    name = json['name'];
    subname = json['subname'];
    IconName = json['IconName'];
    gossip_menu_id = json['gossip_menu_id'];
    minlevel = json['minlevel'];
    maxlevel = json['maxlevel'];
    exp = json['exp'];
    faction = json['faction'];
    npcflag = json['npcflag'];
    speed_walk = json['speed_walk'];
    speed_run = json['speed_run'];
    speed_swim = json['speed_swim'];
    speed_flight = json['speed_flight'];
    detection_range = json['detection_range'];
    scale = json['scale'];
    rank = json['rank'];
    dmgschool = json['dmgschool'];
    DamageModifier = json['DamageModifier'];
    BaseAttackTime = json['BaseAttackTime'];
    RangeAttackTime = json['RangeAttackTime'];
    BaseVariance = json['BaseVariance'];
    RangeVariance = json['RangeVariance'];
    unit_class = json['unit_class'];
    unit_flags = json['unit_flags'];
    unit_flags2 = json['unit_flags2'];
    dynamicflags = json['dynamicflags'];
    family = json['family'];
    trainer_type = json['trainer_type'];
    trainer_spell = json['trainer_spell'];
    trainer_class = json['trainer_class'];
    trainer_race = json['trainer_race'];
    type = json['type'];
    type_flags = json['type_flags'];
    lootid = json['lootid'];
    pickpocketloot = json['pickpocketloot'];
    skinloot = json['skinloot'];
    PetSpellDataId = json['PetSpellDataId'];
    VehicleId = json['VehicleId'];
    mingold = json['mingold'];
    maxgold = json['maxgold'];
    AIName = json['AIName'];
    MovementType = json['MovementType'];
    HoverHeight = json['HoverHeight'];
    HealthModifier = json['HealthModifier'];
    ManaModifier = json['ManaModifier'];
    ArmorModifier = json['ArmorModifier'];
    ExperienceModifier = json['ExperienceModifier'];
    RacialLeader = json['RacialLeader'];
    movementId = json['movementId'];
    RegenHealth = json['RegenHealth'];
    mechanic_immune_mask = json['mechanic_immune_mask'];
    spell_school_immune_mask = json['spell_school_immune_mask'];
    flags_extra = json['flags_extra'];
    ScriptName = json['ScriptName'];
    VerifiedBuild = json['VerifiedBuild'];
  }

  Map<String, String> toJson() {
    return {
      'entry': entry.toString(),
      'difficulty_entry_1': difficulty_entry_1.toString(),
      'difficulty_entry_2': difficulty_entry_2.toString(),
      'difficulty_entry_3': difficulty_entry_3.toString(),
      'KillCredit1': KillCredit1.toString(),
      'KillCredit2': KillCredit2.toString(),
      'modelid1': modelid1.toString(),
      'modelid2': modelid2.toString(),
      'modelid3': modelid3.toString(),
      'modelid4': modelid4.toString(),
      'name': name.toString(),
      'subname': subname.toString(),
      'IconName': IconName.toString(),
      'gossip_menu_id': gossip_menu_id.toString(),
      'minlevel': minlevel.toString(),
      'maxlevel': maxlevel.toString(),
      'exp': exp.toString(),
      'faction': faction.toString(),
      'npcflag': npcflag.toString(),
      'speed_walk': speed_walk.toString(),
      'speed_run': speed_run.toString(),
      'speed_swim': speed_swim.toString(),
      'speed_flight': speed_flight.toString(),
      'detection_range': detection_range.toString(),
      'scale': scale.toString(),
      'rank': rank.toString(),
      'dmgschool': dmgschool.toString(),
      'DamageModifier': DamageModifier.toString(),
      'BaseAttackTime': BaseAttackTime.toString(),
      'RangeAttackTime': RangeAttackTime.toString(),
      'BaseVariance': BaseVariance.toString(),
      'RangeVariance': RangeVariance.toString(),
      'unit_class': unit_class.toString(),
      'unit_flags': unit_flags.toString(),
      'unit_flags2': unit_flags2.toString(),
      'dynamicflags': dynamicflags.toString(),
      'family': family.toString(),
      'trainer_type': trainer_type.toString(),
      'trainer_spell': trainer_spell.toString(),
      'trainer_class': trainer_class.toString(),
      'trainer_race': trainer_race.toString(),
      'type': type.toString(),
      'type_flags': type_flags.toString(),
      'lootid': lootid.toString(),
      'pickpocketloot': pickpocketloot.toString(),
      'skinloot': skinloot.toString(),
      'PetSpellDataId': PetSpellDataId.toString(),
      'VehicleId': VehicleId.toString(),
      'mingold': mingold.toString(),
      'maxgold': maxgold.toString(),
      'AIName': AIName.toString(),
      'MovementType': MovementType.toString(),
      'HoverHeight': HoverHeight.toString(),
      'HealthModifier': HealthModifier.toString(),
      'ManaModifier': ManaModifier.toString(),
      'ArmorModifier': ArmorModifier.toString(),
      'ExperienceModifier': ExperienceModifier.toString(),
      'RacialLeader': RacialLeader.toString(),
      'movementId': movementId.toString(),
      'RegenHealth': RegenHealth.toString(),
      'mechanic_immune_mask': mechanic_immune_mask.toString(),
      'spell_school_immune_mask': spell_school_immune_mask.toString(),
      'flags_extra': flags_extra.toString(),
      'ScriptName': ScriptName.toString(),
      'VerifiedBuild': VerifiedBuild.toString(),
    };
  }
}

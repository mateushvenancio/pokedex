class Ability {
  int id;
  String name;
  String effect;
  String shortEffect;

  Ability.fromJson(Map map) {
    this.id = map['id'];
    this.name = map['name'];
    this.effect = map['effect_entries']['effect'];
    this.shortEffect = map['effect_entries']['short_effect'];
  }
}

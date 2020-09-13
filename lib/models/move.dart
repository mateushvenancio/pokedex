class Move {
  int id;
  String name;
  String about;
  String moveClass;
  String moveType;
  int power;
  int accuracy;
  String url;

  Move.fromPokemon(Map map) {
    this.name = map['name'];
    this.url = map['url'];
  }

  Move.fromJson(Map map) {
    this.id = map['id'];
    this.name = map['name'];
    this.about = map['effect_entries'][0]['effect'];
    this.moveClass = map['damage_class']['name'];
    this.moveType = map['type']['name'];
    this.power = map['power'];
    this.accuracy = map['accuracy'];
  }
}

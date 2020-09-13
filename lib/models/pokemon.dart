import 'package:pokedex/models/move.dart';

class Pokemon {
  int id;
  String name;
  String image;
  String type1;
  String type2;
  Stats stats;
  List<Move> moves;

  Pokemon.fromJson(Map map) {
    this.id = map['id'];
    this.name = map['name'];
    this.image = map['sprites']['other']['official-artwork']['front_default'];
    this.type1 = map['types'][0]['type']['name'];
    if (map['types'].length > 1) {
      this.type2 = map['types'][1]['type']['name'];
    }
    this.stats = Stats.fromJson(map['stats']);
    if (map['moves'] != null) {
      List<Move> _moves = List<Move>();

      map['moves'].forEach((e) {
        _moves.add(Move.fromPokemon(e));
      });

      moves = _moves;
    }
  }
}

class Stats {
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;

  Stats.fromJson(List json) {
    this.hp = json[0]["base_stat"];
    this.attack = json[1]["base_stat"];
    this.defense = json[2]["base_stat"];
    this.specialAttack = json[3]["base_stat"];
    this.specialDefense = json[4]["base_stat"];
    this.speed = json[5]["base_stat"];
  }
}

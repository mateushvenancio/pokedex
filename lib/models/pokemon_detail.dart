import 'package:pokedex/models/pokemon.dart';

class PokemonDetail {
  Pokemon pokemon;
  String about;
  String specie;

  PokemonDetail({
    this.pokemon,
    this.about,
    this.specie,
  });

  PokemonDetail.fromJson(Map map) {
    if (map['flavor_text_entries'] != null) {
      this.about = map['flavor_text_entries']
          .firstWhere((e) => e['language']['name'] == 'en')['flavor_text']
          .replaceAll('\n', ' ');
    }
    if (map['genera'] != null) {
      this.specie = map['genera']
          .firstWhere((e) => e['language']['name'] == 'en')['genus']
          .replaceAll('\n', ' ');
    }
  }
}

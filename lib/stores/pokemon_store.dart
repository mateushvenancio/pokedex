import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemon.dart';
part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  @observable
  ObservableList<Pokemon> pokemons = <Pokemon>[].asObservable();

  @action
  Pokemon getPokemonByName(String name) {
    return pokemons.firstWhere((element) => element.name == name);
  }

  @action
  Color getTypeColor(String type) {
    switch (type) {
      case 'Normal':
        return Color(0xFFA8A77A);
        break;
      case 'Fire':
        return Color(0xFFEE8130);
        break;
      case 'Water':
        return Color(0xFF6390F0);
        break;
      case 'Electric':
        return Color(0xFFF7D02C);
        break;
      case 'Grass':
        return Color(0xFF7AC74C);
        break;
      case 'Ice':
        return Color(0xFF96D9D6);
        break;
      case 'Fighting':
        return Color(0xFFC22E28);
        break;
      case 'Poison':
        return Color(0xFFA33EA1);
        break;
      case 'Ground':
        return Color(0xFFE2BF65);
        break;
      case 'Flying':
        return Color(0xFFA98FF3);
        break;
      case 'Psychic':
        return Color(0xFFF95587);
        break;
      case 'Bug':
        return Color(0xFFA6B91A);
        break;
      case 'Rock':
        return Color(0xFFB6A136);
        break;
      case 'Ghost':
        return Color(0xFF735797);
        break;
      case 'Dragon':
        return Color(0xFF6F35FC);
        break;
      case 'Dark':
        return Color(0xFF705746);
        break;
      case 'Steel':
        return Color(0xFFB7B7CE);
        break;
      case 'Fairy':
        return Color(0xFFD685AD);
        break;
      default:
        return Color(0xFF6376b8);
    }
  }
}

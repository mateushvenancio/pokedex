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
}

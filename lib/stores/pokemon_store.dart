import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemon.dart';
part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  Dio dio = Dio();

  @observable
  ObservableList<Pokemon> pokemons = <Pokemon>[].asObservable();

  @action
  getAllPokemons() async {
    Response response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon/?limit=1050',
    );
    Map _data = response.data;

    List _list = _data['results'];
    int _count = _data['count'];

    for (int i = 0; i < _count; i++) {
      try {
        await getPokemon(_list[i]['url']);
      } catch (e) {
        print('O ERRO É ESSE AQUI: ${_list[i]}');
      }
    }

    print('DADOS: $_data');
  }

  @action
  getPokemon(String url) async {
    Response response = await dio.get(url);
    Map _data = response.data;

    pokemons.add(Pokemon.fromJson(_data));
  }

  @action
  getPokemonDetail(int id) async {}
}

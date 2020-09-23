import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/models/pokemon.dart';
import 'dart:convert';

import 'package:pokedex/stores/pokemon_store.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final pokemonStore = Modular.get<PokemonStore>();

  initApp(context) async {
    var dados =
        await DefaultAssetBundle.of(context).loadString('assets/pokemons.json');
    List allPokemon = json.decode(dados);

    allPokemon.forEach((element) {
      pokemonStore.pokemons.add(Pokemon.fromJson(element));
    });

    Modular.to.pushReplacementNamed('/home');
  }
}

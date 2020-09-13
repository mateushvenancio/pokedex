// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonStore on _PokemonStoreBase, Store {
  final _$pokemonsAtom = Atom(name: '_PokemonStoreBase.pokemons');

  @override
  ObservableList<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$getAllPokemonsAsyncAction =
      AsyncAction('_PokemonStoreBase.getAllPokemons');

  @override
  Future getAllPokemons() {
    return _$getAllPokemonsAsyncAction.run(() => super.getAllPokemons());
  }

  final _$getPokemonAsyncAction = AsyncAction('_PokemonStoreBase.getPokemon');

  @override
  Future getPokemon(String url) {
    return _$getPokemonAsyncAction.run(() => super.getPokemon(url));
  }

  final _$getPokemonDetailAsyncAction =
      AsyncAction('_PokemonStoreBase.getPokemonDetail');

  @override
  Future getPokemonDetail(int id) {
    return _$getPokemonDetailAsyncAction.run(() => super.getPokemonDetail(id));
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons}
    ''';
  }
}

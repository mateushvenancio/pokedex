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

  final _$_PokemonStoreBaseActionController =
      ActionController(name: '_PokemonStoreBase');

  @override
  Pokemon getPokemonByName(String name) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.getPokemonByName');
    try {
      return super.getPokemonByName(name);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons}
    ''';
  }
}

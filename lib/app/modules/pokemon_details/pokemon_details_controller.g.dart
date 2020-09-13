// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PokemonDetailsController = BindInject(
  (i) => PokemonDetailsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailsController on _PokemonDetailsControllerBase, Store {
  final _$valueAtom = Atom(name: '_PokemonDetailsControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_PokemonDetailsControllerBaseActionController =
      ActionController(name: '_PokemonDetailsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_PokemonDetailsControllerBaseActionController
        .startAction(name: '_PokemonDetailsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_PokemonDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}

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
  final _$detailAtom = Atom(name: '_PokemonDetailsControllerBase.detail');

  @override
  PokemonDetail get detail {
    _$detailAtom.reportRead();
    return super.detail;
  }

  @override
  set detail(PokemonDetail value) {
    _$detailAtom.reportWrite(value, super.detail, () {
      super.detail = value;
    });
  }

  final _$movesLoadingAtom =
      Atom(name: '_PokemonDetailsControllerBase.movesLoading');

  @override
  bool get movesLoading {
    _$movesLoadingAtom.reportRead();
    return super.movesLoading;
  }

  @override
  set movesLoading(bool value) {
    _$movesLoadingAtom.reportWrite(value, super.movesLoading, () {
      super.movesLoading = value;
    });
  }

  final _$loadDetailAsyncAction =
      AsyncAction('_PokemonDetailsControllerBase.loadDetail');

  @override
  Future loadDetail(Pokemon pokemon) {
    return _$loadDetailAsyncAction.run(() => super.loadDetail(pokemon));
  }

  final _$getMovesAsyncAction =
      AsyncAction('_PokemonDetailsControllerBase.getMoves');

  @override
  Future getMoves() {
    return _$getMovesAsyncAction.run(() => super.getMoves());
  }

  @override
  String toString() {
    return '''
detail: ${detail},
movesLoading: ${movesLoading}
    ''';
  }
}

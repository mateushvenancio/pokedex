// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moves_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovesStore on _MovesStoreBase, Store {
  final _$doneLoadingAtom = Atom(name: '_MovesStoreBase.doneLoading');

  @override
  bool get doneLoading {
    _$doneLoadingAtom.reportRead();
    return super.doneLoading;
  }

  @override
  set doneLoading(bool value) {
    _$doneLoadingAtom.reportWrite(value, super.doneLoading, () {
      super.doneLoading = value;
    });
  }

  final _$movesAtom = Atom(name: '_MovesStoreBase.moves');

  @override
  ObservableList<Move> get moves {
    _$movesAtom.reportRead();
    return super.moves;
  }

  @override
  set moves(ObservableList<Move> value) {
    _$movesAtom.reportWrite(value, super.moves, () {
      super.moves = value;
    });
  }

  final _$getAllMovesAsyncAction = AsyncAction('_MovesStoreBase.getAllMoves');

  @override
  Future getAllMoves() {
    return _$getAllMovesAsyncAction.run(() => super.getAllMoves());
  }

  final _$getMoveAsyncAction = AsyncAction('_MovesStoreBase.getMove');

  @override
  Future getMove(String url) {
    return _$getMoveAsyncAction.run(() => super.getMove(url));
  }

  @override
  String toString() {
    return '''
doneLoading: ${doneLoading},
moves: ${moves}
    ''';
  }
}

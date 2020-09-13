import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/move.dart';
part 'moves_store.g.dart';

class MovesStore = _MovesStoreBase with _$MovesStore;

abstract class _MovesStoreBase with Store {
  Dio dio = Dio();

  @observable
  bool doneLoading = false;
  @observable
  ObservableList<Move> moves = <Move>[].asObservable();

  @action
  getAllMoves() async {
    Response response =
        await dio.get('https://pokeapi.co/api/v2/move?limit=813');

    List results = response.data['results'];

    for (var i in results) {
      try {
        await getMove(i['url']);
      } catch (e) {
        print('ERRO AQUI: $e');
      }
    }

    doneLoading = true;
  }

  @action
  getMove(String url) async {
    Response response = await dio.get(url);
    moves.add(Move.fromJson(response.data));
  }
}

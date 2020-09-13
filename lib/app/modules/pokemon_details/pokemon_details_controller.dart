import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/models/move.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_detail.dart';

part 'pokemon_details_controller.g.dart';

@Injectable()
class PokemonDetailsController = _PokemonDetailsControllerBase
    with _$PokemonDetailsController;

abstract class _PokemonDetailsControllerBase with Store {
  Dio dio = Dio();

  @observable
  PokemonDetail detail;
  @observable
  bool movesLoading = true;

  @action
  loadDetail(Pokemon pokemon) async {
    Response response = await dio
        .get('https://pokeapi.co/api/v2/pokemon-species/${pokemon.id}');

    PokemonDetail _detail = PokemonDetail.fromJson(response.data);
    _detail.pokemon = pokemon;

    detail = _detail;

    getMoves();
  }

  @action
  getMoves() async {
    for (int i = 0; i < detail.pokemon.moves.length; i++) {
      Response r = await dio.get(detail.pokemon.moves[i].url);
      detail.pokemon.moves[i] = Move.fromJson(r.data);
    }

    movesLoading = false;
  }

  String capitalize(String value) {
    if (value == null) return '';
    if (value.length == 0) return '';
    String newValue = value[0].toUpperCase() + value.substring(1).toLowerCase();

    return newValue;
  }
}

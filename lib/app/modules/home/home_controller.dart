import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/stores/moves_store.dart';
import 'package:pokedex/stores/pokemon_store.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final movesStore = Modular.get<MovesStore>();
  final pokemonStore = Modular.get<PokemonStore>();

  String capitalize(String value) {
    if (value == null) return '';
    if (value.length == 0) return '';
    String newValue = value[0].toUpperCase() + value.substring(1).toLowerCase();

    return newValue;
  }
}

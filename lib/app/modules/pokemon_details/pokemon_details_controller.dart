import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'pokemon_details_controller.g.dart';

@Injectable()
class PokemonDetailsController = _PokemonDetailsControllerBase
    with _$PokemonDetailsController;

abstract class _PokemonDetailsControllerBase with Store {
  String capitalize(String value) {
    if (value == null) return '';
    if (value.length == 0) return '';
    String newValue = value[0].toUpperCase() + value.substring(1).toLowerCase();

    return newValue;
  }
}

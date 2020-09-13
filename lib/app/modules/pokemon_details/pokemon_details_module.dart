import 'pokemon_details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pokemon_details_page.dart';

class PokemonDetailsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PokemonDetailsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PokemonDetailsPage()),
      ];

  static Inject get to => Inject<PokemonDetailsModule>.of();
}

import 'package:pokedex/app/modules/pokemon_details/pokemon_details_module.dart';
import 'package:pokedex/stores/moves_store.dart';
import 'package:pokedex/stores/pokemon_store.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/app_widget.dart';
import 'package:pokedex/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => PokemonStore(), lazy: false),
        Bind((i) => MovesStore(), lazy: false),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/pokemon_details', module: PokemonDetailsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

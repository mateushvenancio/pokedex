import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/app/modules/pokemon_details/pokemon_details_controller.dart';
import 'package:pokedex/app/modules/pokemon_details/pokemon_details_module.dart';

void main() {
  initModule(PokemonDetailsModule());
  // PokemonDetailsController pokemondetails;
  //
  setUp(() {
    //     pokemondetails = PokemonDetailsModule.to.get<PokemonDetailsController>();
  });

  group('PokemonDetailsController Test', () {
    //   test("First Test", () {
    //     expect(pokemondetails, isInstanceOf<PokemonDetailsController>());
    //   });

    //   test("Set Value", () {
    //     expect(pokemondetails.value, equals(0));
    //     pokemondetails.increment();
    //     expect(pokemondetails.value, equals(1));
    //   });
  });
}

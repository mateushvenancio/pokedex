import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.pokemonStore.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokédex'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (controller.pokemonStore.pokemons.length == 0)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView(
            children: controller.pokemonStore.pokemons.map((e) {
              return ListTile(
                onTap: () {},
                leading: Image.network(
                  e.image ??
                      'https://screenshots.gamebanana.com/img/ico/sprays/pokeball.png',
                ),
                title: Text(controller.capitalize(e.name) ?? ''),
                subtitle: Text(
                  controller.capitalize(e.type1) +
                      ' ' +
                      controller.capitalize(e.type2),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

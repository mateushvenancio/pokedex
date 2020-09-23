import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/models/pokemon.dart';
import 'pokemon_details_controller.dart';

class PokemonDetailsPage extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetailsPage(this.pokemon);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState
    extends ModularState<PokemonDetailsPage, PokemonDetailsController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

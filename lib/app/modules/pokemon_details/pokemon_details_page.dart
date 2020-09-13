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
    controller.loadDetail(widget.pokemon);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.network(
                widget.pokemon.image ??
                    'https://screenshots.gamebanana.com/img/ico/sprays/pokeball.png',
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Observer(
              builder: (_) {
                if (controller.detail == null)
                  return Center(child: CircularProgressIndicator());
                return Container(
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Specie: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${controller.detail.specie}',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'About: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${controller.detail.about}',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Observer(
              builder: (_) {
                if (controller.movesLoading)
                  return Center(child: CircularProgressIndicator());
                return ListView(
                  children: controller.detail.pokemon.moves.map((e) {
                    return ListTile(
                      title: Text(
                        controller.capitalize(e.name).replaceAll('-', ' '),
                      ),
                      subtitle: Text(
                        '${e.power ?? '-'} Power • ${e.accuracy ?? '-'} Acc • ${e.moveType}-type',
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

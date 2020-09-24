import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/stores/pokemon_store.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.store.getTypeColor(
        widget.pokemon.typeofpokemon[0],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.pokemon.name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(widget.pokemon.imageurl, height: 150),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.pokemon.typeofpokemon[0],
                              style: TextStyle(
                                color: controller.store.getTypeColor(
                                  widget.pokemon.typeofpokemon[0],
                                ),
                              ),
                            ),
                            if (widget.pokemon.typeofpokemon.length == 2)
                              Text(' • '),
                            if (widget.pokemon.typeofpokemon.length == 2)
                              Text(
                                widget.pokemon.typeofpokemon[1],
                                style: TextStyle(
                                  color: controller.store.getTypeColor(
                                    widget.pokemon.typeofpokemon[1],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Description: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: widget.pokemon.xdescription,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.pokemon.category,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text('Category'),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.pokemon.height,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text('Height'),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.pokemon.weight,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text('Weight'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Stats',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          StatsBar(widget.pokemon.hp, 'HP'),
                          StatsBar(widget.pokemon.attack, 'Atk'),
                          StatsBar(widget.pokemon.defense, 'Def'),
                          StatsBar(widget.pokemon.specialAttack, 'SpA'),
                          StatsBar(widget.pokemon.specialDefense, 'SpD'),
                          StatsBar(widget.pokemon.speed, 'Spe'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Evolution',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 2,
                  color: Colors.white,
                  child: Evolutions(widget.pokemon.evolutions),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatsBar extends StatelessWidget {
  final int value;
  final String label;

  StatsBar(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    double percentage = (value.toDouble() * 100) / 180;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            color: Colors.green,
            height: percentage * 3,
          ),
          Text(label),
        ],
      ),
    );
  }
}

class Evolutions extends StatelessWidget {
  final store = Modular.get<PokemonStore>();
  final List<String> evos;

  Evolutions(this.evos);

  @override
  Widget build(BuildContext context) {
    List<Widget> _evos = [];

    if (evos.length != 1) {
      for (int i = 0; i < evos.length; i++) {
        var _poke = store.getPokemonByName(evos[i]);
        _evos.add(EvolutionsTile(_poke));

        // if (evos[i + 1] != null) {
        //   _evos.add(Icon(Icons.keyboard_arrow_down));
        // }
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(children: _evos),
    );
  }
}

class EvolutionsTile extends StatelessWidget {
  final Pokemon pokemon;

  EvolutionsTile(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/pokemon_details', arguments: pokemon);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 125,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                    opacity: 0.2, child: Image.asset('assets/pokeball.png')),
                Image.network(pokemon.imageurl),
              ],
            ),
          ),
          Text(pokemon.reason ?? ''),
        ],
      ),
    );
  }
}

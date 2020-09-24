import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.store.getTypeColor(
        widget.pokemon.typeofpokemon[0],
      ),
      // appBar: DetailsAppBar(widget.pokemon.name),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(4),
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
                        Text(widget.pokemon.name,
                            style: TextStyle(fontSize: 20)),
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
                padding: EdgeInsets.all(4),
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
                padding: EdgeInsets.all(4),
                width: double.infinity,
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 2,
                  color: Colors.white,
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.all(8.0),
                    child: widget.pokemon.evolutions.isEmpty
                        ? Center(child: Text('Doen\'t evolve'))
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.pokemon.evolutions.map((e) {
                              return Image.network(
                                controller.store.getPokemonByName(e).imageurl,
                              );
                            }).toList(),
                          ),
                  ),
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

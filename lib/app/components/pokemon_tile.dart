import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/stores/pokemon_store.dart';

class PokemonTile extends StatelessWidget {
  final pokemonStore = Modular.get<PokemonStore>();
  final Pokemon model;
  final Function onTap;

  PokemonTile(this.model, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: pokemonStore.getTypeColor(model.typeofpokemon[0]),
        elevation: 2,
        child: InkWell(
          onTap: () {
            if (onTap != null) onTap();
          },
          child: Container(
            padding: EdgeInsets.all(4),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Opacity(
                  opacity: 0.15,
                  child: Image.asset('assets/pokeball.png'),
                ),
                Image.network(model.imageurl),
                Positioned(
                  left: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      pokemonTypeChip(model.typeofpokemon[0]),
                      SizedBox(height: 2),
                      if (model.typeofpokemon.length == 2)
                        pokemonTypeChip(model.typeofpokemon[1]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget pokemonTypeChip(String type) {
  final pokemonStore = Modular.get<PokemonStore>();

  return Container(
    child: Text(
      type ?? '',
      style: TextStyle(
        color: pokemonStore.getTypeColor(type),
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22.5),
      color: Colors.white,
    ),
  );
}

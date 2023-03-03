import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNameType({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.06.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  pokemon.name!,
                  style: Constans.getPokemonNameTextStyle(),
                ),
              ),
              Text(
                "# ${pokemon.num}",
                style: Constans.getPokemonNameTextStyle(),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Chip(
            label: Text(
              pokemon.type?.join(" ,") ?? "",
              style: Constans.getPokemonTypeTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}

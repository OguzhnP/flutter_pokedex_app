import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeInfo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          55.w,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow("Name", pokemon.name),
            _buildInformationRow("Height", pokemon.height),
            _buildInformationRow("Weight", pokemon.weight),
            _buildInformationRow("Spawn Time", pokemon.spawnTime),
            _buildInformationRow("Weakness", pokemon.weaknesses.toString()),
            _buildInformationRow(
                "Pre Evolution", pokemon.prevEvolution.toString()),
            _buildInformationRow(
                "Next Evolution", pokemon.nextEvolution.toString()),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constans.getPokemonInfoLabelTextStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(", "),
            style: Constans.getPokemonInfoTextStyle(),
          )
        else if (value == null)
          Text(
            "Not available",
            style: Constans.getPokemonInfoTextStyle(),
          )
        else
          Text(
            value,
            style: Constans.getPokemonInfoTextStyle(),
          )
      ],
    );
  }
}

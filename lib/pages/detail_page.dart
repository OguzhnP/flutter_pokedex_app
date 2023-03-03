import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/widgets/poke_info.dart';
import 'package:pokedex/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final String _imagePath = "images/pokeball.png";

    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: IconButton(
                iconSize: 55.h,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          PokeNameType(pokemon: pokemon),
          const SizedBox(height: 25),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  _imagePath,
                  height: 0.15.sh,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: .12.sh,
                  child: PokeInfo(pokemon: pokemon)),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemon.id!,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img!,
                    height: .25.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ],
          )),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeImgAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    const String _imagePath = "images/pokeball.png";
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            _imagePath,
            width: UIHelper.calculatePokeImgAndBall(),
            height: UIHelper.calculatePokeImgAndBall(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline),
              imageUrl: pokemon.img!,
              width: UIHelper.calculatePokeImgAndBall(),
              height: UIHelper.calculatePokeImgAndBall(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

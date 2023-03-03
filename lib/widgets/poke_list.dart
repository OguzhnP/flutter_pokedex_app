import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/services/pokdex_api.dart';
import 'package:pokedex/widgets/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _list = snapshot.data!;
          return GridView.builder(
            itemCount: _list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
            itemBuilder: (context, index) {
              return PokeListItem(
                pokemon: _list[index],
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Hata!"),
          );
        } else {
          return const CircularProgressIndicator.adaptive();
        }
      },
      future: _pokemonList,
    );
  }
}

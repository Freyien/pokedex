import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokemon/features/pokemon_list/ui/widgets/pokemon_card.dart';

class PokemonListSuccess extends StatelessWidget {
  const PokemonListSuccess({super.key, required this.pokemonList});

  final List<PokemonEntity> pokemonList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 40),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final pokemon = pokemonList[index];

            return PokemonCard(
              pokemon: pokemon,
              index: index,
            );
          },
          childCount: pokemonList.length,
        ),
      ),
    );
  }
}

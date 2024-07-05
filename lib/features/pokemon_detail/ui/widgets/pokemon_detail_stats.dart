import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/stat_line.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';

class PokemonDetailStats extends StatelessWidget {
  const PokemonDetailStats({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(.04),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          pokemon.stats.length,
          (index) {
            final stat = pokemon.stats[index];

            return StatLine(
              stat: stat,
              color: pokemon.color,
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/move_item.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';

class PokemonDetailMoves extends StatelessWidget {
  const PokemonDetailMoves({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(.04),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 16,
          spacing: 12,
          children: List.generate(
            pokemon.moves.length <= 8 ? pokemon.moves.length : 8,
            (index) {
              final move = pokemon.moves[index];

              return MoveItem(move: move.name);
            },
          ),
        ),
      ),
    );
  }
}

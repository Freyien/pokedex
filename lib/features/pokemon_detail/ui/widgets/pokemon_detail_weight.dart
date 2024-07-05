import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/core/ui/widgets/core_widgets.dart';

class PokemonDetailWeight extends StatelessWidget {
  const PokemonDetailWeight({super.key, required this.weightInKgs});
  final String weightInKgs;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      from: 30,
      duration: const Duration(milliseconds: 450),
      child: Column(
        children: [
          TitleMedium('$weightInKgs KG'),
          const BodySmall('Weight'),
        ],
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/core/ui/widgets/core_widgets.dart';

class PokemonDetailHeight extends StatelessWidget {
  const PokemonDetailHeight({super.key, required this.heightInMts});

  final String heightInMts;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 30,
      duration: const Duration(milliseconds: 450),
      child: Column(
        children: [
          TitleMedium('$heightInMts M'),
          const BodySmall('Height'),
        ],
      ),
    );
  }
}

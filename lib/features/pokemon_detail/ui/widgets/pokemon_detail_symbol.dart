import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonDetailSymbol extends StatelessWidget {
  const PokemonDetailSymbol({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: SvgPicture.asset(
        'assets/icons/fire.svg',
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

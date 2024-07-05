import 'package:flutter/material.dart';

class PokemonDetailTabbar extends StatelessWidget {
  const PokemonDetailTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicator: UnderlineTabIndicator(
        insets: EdgeInsets.symmetric(vertical: 10),
      ),
      tabs: [
        Tab(text: 'Stats'),
        Tab(text: 'Moves'),
      ],
    );
  }
}

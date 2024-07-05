import 'package:flutter/material.dart';

class PokemonListFailed extends StatelessWidget {
  const PokemonListFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(child: Text('Ha sucedido un error :(')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/ui/extensions/string.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';

class PokemonDetailName extends StatelessWidget {
  const PokemonDetailName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      buildWhen: (p, c) => p.selectedIndex != c.selectedIndex,
      builder: (context, state) {
        return Text(state.selectedPokemon.name.capitalize());
      },
    );
  }
}

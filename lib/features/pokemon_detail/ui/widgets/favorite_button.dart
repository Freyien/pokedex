import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      buildWhen: (p, c) =>
          p.selectedIndex != c.selectedIndex || p.pokemonList != c.pokemonList,
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            final pokemonBloc = context.read<PokemonListBloc>();
            pokemonBloc.add(
                AddPokemonToFavoriteEvent(pokemonBloc.state.selectedIndex));
          },
          icon: SvgPicture.asset(
            state.selectedPokemon.isFavorite
                ? 'assets/icons/favorite.svg'
                : 'assets/icons/favorite_outline_detail.svg',
            height: 36,
            width: 36,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/domain/enums/fetching_status.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';
import 'package:pokemon/features/pokemon_list/ui/widgets/pokemon_list_builder/pokemon_list_failed.dart';
import 'package:pokemon/features/pokemon_list/ui/widgets/pokemon_list_builder/pokemon_list_loading.dart';
import 'package:pokemon/features/pokemon_list/ui/widgets/pokemon_list_builder/pokemon_list_success.dart';

class PokemonListBuilder extends StatelessWidget {
  const PokemonListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      buildWhen: (p, c) =>
          p.fetchingStatus != c.fetchingStatus ||
          p.pokemonList != c.pokemonList,
      builder: (context, state) {
        switch (state.fetchingStatus) {
          case FetchingStatus.initial:
          case FetchingStatus.loading:
            return const PokemonListLoading();
          case FetchingStatus.success:
            return PokemonListSuccess(pokemonList: state.pokemonList);
          case FetchingStatus.failed:
            return const PokemonListFailed();
        }
      },
    );
  }
}

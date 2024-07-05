import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';

class LoadingMore extends StatelessWidget {
  const LoadingMore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      buildWhen: (p, c) => p.isLoadingMore != c.isLoadingMore,
      builder: (context, state) {
        if (!state.isLoadingMore) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        return const SliverToBoxAdapter(
          child: SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

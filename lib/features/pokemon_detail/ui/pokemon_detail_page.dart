import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/core/ui/widgets/core_widgets.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/favorite_button.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/pokemon_detail_background.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/pokemon_detail_height.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/pokemon_detail_image.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/pokemon_detail_moves.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/pokemon_detail_name.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/pokemon_detail_stats.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/pokemon_detail_symbol.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/pokemon_detail_tabbar.dart';
import 'package:pokemon/features/pokemon_detail/ui/widgets/pokemon_detail_weight.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
            ),
          ),
          actions: const [FavoriteButton()],
          title: const PokemonDetailName(),
        ),
        body: BlocBuilder<PokemonListBloc, PokemonListState>(
          buildWhen: (p, c) => p.pokemonList != c.pokemonList,
          builder: (context, state) {
            return PokemonDetailBackground(
              pokemonList: state.pokemonList,
              selectedIndex: state.selectedIndex,
              builder: (pokemon) {
                return [
                  VerticalSpace.large(),
                  // Pokemon image
                  PokemonDetailImage(pokemon: pokemon),

                  VerticalSpace.xxlarge(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Height
                      PokemonDetailHeight(heightInMts: pokemon.heightInMts),

                      // Symbol
                      PokemonDetailSymbol(color: pokemon.color),

                      // Weight
                      PokemonDetailWeight(weightInKgs: pokemon.weightInKgs),
                    ],
                  ),
                  VerticalSpace.xxlarge(),

                  // Tabs
                  const PokemonDetailTabbar(),
                  VerticalSpace.xlarge(),

                  // Tabview
                  SizedBox(
                    height: 216,
                    child: TabBarView(
                      children: [
                        // Stats
                        PokemonDetailStats(pokemon: pokemon),

                        // Moves
                        PokemonDetailMoves(pokemon: pokemon),
                      ],
                    ),
                  ),
                ];
              },
            );
          },
        ),
      ),
    );
  }
}

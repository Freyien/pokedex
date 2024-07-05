import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/core/ui/widgets/core_widgets.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon, required this.index});

  final PokemonEntity pokemon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return _BackgroundCard(
      color: pokemon.color,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              context.read<PokemonListBloc>().add(SelectPokemonEvent(index));

              if (MediaQuery.of(context).viewInsets.bottom == 0.0) {
                context.pushNamed('pokemon_detail', extra: pokemon);
                return;
              }

              // Hide keyboard time
              Future.delayed(const Duration(milliseconds: 200), () {
                context.pushNamed('pokemon_detail', extra: pokemon);
              });
              return;
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // Image
                  Expanded(
                    child: Hero(
                      tag: 'pokemon${pokemon.id}',
                      child: CachedNetworkImage(
                        imageUrl: pokemon.imageUrl,
                      ),
                    ),
                  ),

                  // Pokemon name
                  Row(
                    children: [
                      Expanded(
                        child: LabelMedium(pokemon.name),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow.svg',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

        // Favorite button
        Positioned(
          child: IconButton(
            visualDensity: const VisualDensity(vertical: -1),
            onPressed: () {
              context
                  .read<PokemonListBloc>()
                  .add(AddPokemonToFavoriteEvent(index));
            },
            icon: SvgPicture.asset(
              pokemon.isFavorite
                  ? 'assets/icons/favorite.svg'
                  : 'assets/icons/favorite_outline.svg',
            ),
          ),
        ),
      ],
    );
  }
}

class _BackgroundCard extends StatelessWidget {
  const _BackgroundCard({
    required this.children,
    required this.color,
  });

  final List<Widget> children;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black26,
                Colors.black38,
              ],
              stops: [0, .45, .65],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}

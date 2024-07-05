import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';

class PokemonDetailImage extends StatelessWidget {
  const PokemonDetailImage({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(.05),
              Colors.white.withOpacity(.20),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -50,
              child: Opacity(
                opacity: .15,
                child: Container(
                  height: 500,
                  width: 500,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        pokemon.color,
                        pokemon.color.withOpacity(.1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Hero(
                  tag: 'pokemon${pokemon.id}',
                  child: CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                    height: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

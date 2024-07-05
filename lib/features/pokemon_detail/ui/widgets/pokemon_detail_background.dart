import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';

class PokemonDetailBackground extends StatefulWidget {
  const PokemonDetailBackground({
    super.key,
    required this.builder,
    required this.pokemonList,
    required this.selectedIndex,
  });

  final List<Widget> Function(PokemonEntity) builder;
  final List<PokemonEntity> pokemonList;
  final int selectedIndex;

  @override
  State<PokemonDetailBackground> createState() =>
      _PokemonDetailBackgroundState();
}

class _PokemonDetailBackgroundState extends State<PokemonDetailBackground> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: widget.selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple light
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            'assets/images/purple.png',
            fit: BoxFit.cover,
          ),
        ),

        // blue light
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/images/blue.png',
            fit: BoxFit.cover,
          ),
        ),

        // Page view
        PageView.builder(
          controller: controller,
          onPageChanged: (index) {
            final pokemonBloc = context.read<PokemonListBloc>();
            pokemonBloc.add(SelectPokemonEvent(index));

            if (pokemonBloc.state.pokemonList.length - index >= 5) return;

            pokemonBloc.add(GetMorePokemonListEvent());
          },
          itemCount: widget.pokemonList.length,
          itemBuilder: (context, index) {
            final pokemon = widget.pokemonList[index];

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: widget.builder(pokemon),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon/features/pokemon_list/ui/widgets/background_lights.dart';
import 'package:pokemon/features/pokemon_list/ui/widgets/loading_more.dart';
import 'package:pokemon/features/pokemon_list/ui/widgets/pokemon_list_builder/pokemon_list_builder.dart';
import 'package:pokemon/features/pokemon_list/ui/widgets/pokemon_list_header.dart';
import 'package:pokemon/features/pokemon_list/ui/widgets/pokemon_list_infinite_scroll.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/menu.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/avatar.png'),
          )
        ],
      ),
      body: const BackgroundLights(
        child: PokemonListInfiniteScroll(
          slivers: [
            // Header
            PokemonListHeader(),

            // Pokemon List Builder
            PokemonListBuilder(),

            // Loading More
            LoadingMore(),
          ],
        ),
      ),
    );
  }
}

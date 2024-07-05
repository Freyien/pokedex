import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon/core/ui/widgets/core_widgets.dart';

class PokemonListHeader extends StatelessWidget {
  const PokemonListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(12),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const TitleLarge('Encuentra a tu Pokémon'),
            VerticalSpace.xxxlarge(),

            // Searchbar
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/search.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  hintText: 'Buscar',
                ),
              ),
            ),
            VerticalSpace.xlarge(),
          ],
        ),
      ),
    );
  }
}

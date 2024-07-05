import 'package:go_router/go_router.dart';
import 'package:pokemon/features/pokemon_detail/ui/pokemon_detail_page.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokemon/features/pokemon_list/ui/pokemon_list_page.dart';

class AppRouter {
  static GoRouter get router {
    final router = GoRouter(
      initialLocation: '/pokemon_list',
      routes: [
        GoRoute(
          name: 'pokemon_list',
          path: '/pokemon_list',
          builder: (context, state) {
            return const PokemonListPage();
          },
        ),
        GoRoute(
          name: 'pokemon_detail',
          path: '/pokemon_detail',
          builder: (context, state) {
            final pokemon = state.extra as PokemonEntity;

            return PokemonDetailPage(pokemon: pokemon);
          },
        ),
      ],
    );

    return router;
  }
}

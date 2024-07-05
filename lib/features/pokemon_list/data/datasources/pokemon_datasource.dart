import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';

abstract class PokemonDatasource {
  Future<List<String>> getPokemonUrlList(
    int offset, {
    int limit = 20,
  });

  Future<List<PokemonEntity>> getPokemonList(List<String> urlList);
}

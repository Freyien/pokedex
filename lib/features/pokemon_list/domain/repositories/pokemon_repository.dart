import 'package:pokemon/core/domain/entities/response.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Response<List<PokemonEntity>>> getPokemonList(
    int offset, {
    int limit = 20,
  });
}

import 'package:pokemon/core/domain/entities/response.dart';
import 'package:pokemon/core/domain/failures/failures.dart';
import 'package:pokemon/features/pokemon_list/data/datasources/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokemon/features/pokemon_list/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource _datasource;

  PokemonRepositoryImpl(this._datasource);

  @override
  Future<Response<List<PokemonEntity>>> getPokemonList(
    int offset, {
    int limit = 20,
  }) async {
    try {
      final urlList = await _datasource.getPokemonUrlList(offset);

      final pokemonList = await _datasource.getPokemonList(urlList);

      return Response.success(pokemonList);
    } catch (_) {
      return Response.failed(UnexpectedFailure());
    }
  }
}

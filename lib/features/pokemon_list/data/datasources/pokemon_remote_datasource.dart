import 'package:dio/dio.dart';
import 'package:pokemon/features/pokemon_list/data/datasources/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';

class PokemonRemoteDatasource implements PokemonDatasource {
  final Dio _client;

  PokemonRemoteDatasource(this._client);

  @override
  Future<List<String>> getPokemonUrlList(
    int offset, {
    int limit = 20,
  }) async {
    final result = await _client.get(
      '/pokemon?offset=$offset&limit=$limit',
    );

    final urlList = List<String>.from(
      result.data['results'].map(
        (e) => e['url'],
      ),
    );

    return urlList;
  }

  @override
  Future<List<PokemonEntity>> getPokemonList(List<String> urlList) async {
    List<Future> futureList = [];

    for (var url in urlList) {
      futureList.add(_client.get(url));
    }

    final resultList = await Future.wait(futureList);

    final pokemonList = List<PokemonEntity>.from(
      resultList.map(
        (result) =>
            PokemonEntity.fromMap(Map<String, dynamic>.from(result.data)),
      ),
    );

    return pokemonList;
  }
}

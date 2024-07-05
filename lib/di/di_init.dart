import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/features/pokemon_list/data/datasources/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon_list/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokemon/features/pokemon_list/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/features/pokemon_list/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';

GetIt sl = GetIt.instance;

void diInit() {
  _registerNetwork();

  _registerDataSources();

  _registerRepositories();

  _registerBlocs();
}

void _registerNetwork() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
    ),
  );

  sl.registerLazySingleton<Dio>(() => dio);
}

void _registerDataSources() {
  sl.registerLazySingleton<PokemonDatasource>(
    () => PokemonRemoteDatasource(sl()),
  );
}

void _registerRepositories() {
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(sl()),
  );
}

void _registerBlocs() {
  sl.registerFactory<PokemonListBloc>(
    () => PokemonListBloc(sl()),
  );
}

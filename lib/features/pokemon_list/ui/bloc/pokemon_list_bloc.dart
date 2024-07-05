import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/core/domain/enums/fetching_status.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokemon/features/pokemon_list/domain/repositories/pokemon_repository.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository _repository;

  PokemonListBloc(this._repository) : super(PokemonListState.initial()) {
    on<GetPokemonListEvent>(_onGetPokemonListEvent);
    on<GetMorePokemonListEvent>(_onGetMorePokemonListEvent);
    on<SelectPokemonEvent>(_onSelectPokemonEvent);
    on<AddPokemonToFavoriteEvent>(_onAddPokemonToFavoriteEvent);
  }

  Future<void> _onGetPokemonListEvent(
    GetPokemonListEvent event,
    Emitter<PokemonListState> emit,
  ) async {
    emit(state.copyWith(
      fetchingStatus: FetchingStatus.loading,
      page: 0,
    ));

    final result = await _repository.getPokemonList(0);

    if (result.isSuccess) {
      return emit(state.copyWith(
        fetchingStatus: FetchingStatus.success,
        pokemonList: result.data,
      ));
    }

    emit(state.copyWith(fetchingStatus: FetchingStatus.failed));
  }

  Future<void> _onGetMorePokemonListEvent(
    GetMorePokemonListEvent event,
    Emitter<PokemonListState> emit,
  ) async {
    emit(state.copyWith(isLoadingMore: true));

    final result = await _repository.getPokemonList(state.offset);

    if (result.isSuccess) {
      final newPokemonList = [...state.pokemonList, ...result.data!];
      final nextPage = state.page + 1;

      return emit(state.copyWith(
        isLoadingMore: false,
        pokemonList: newPokemonList,
        page: nextPage,
      ));
    }

    emit(state.copyWith(isLoadingMore: false));
  }

  Future<void> _onSelectPokemonEvent(
    SelectPokemonEvent event,
    Emitter<PokemonListState> emit,
  ) async {
    emit(state.copyWith(selectedIndex: event.index));
  }

  Future<void> _onAddPokemonToFavoriteEvent(
    AddPokemonToFavoriteEvent event,
    Emitter<PokemonListState> emit,
  ) async {
    final index = event.index;
    final selectedPokemon = state.pokemonList[index];
    final newPokemon = selectedPokemon.copyWith(
      isFavorite: !selectedPokemon.isFavorite,
    );

    final newPokemonList = [...state.pokemonList];

    newPokemonList.replaceRange(index, index + 1, [newPokemon]);

    emit(state.copyWith(pokemonList: newPokemonList));
  }
}

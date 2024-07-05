part of 'pokemon_list_bloc.dart';

class PokemonListState extends Equatable {
  const PokemonListState({
    required this.fetchingStatus,
    required this.pokemonList,
    required this.isLoadingMore,
    required this.selectedIndex,
    required this.page,
  });

  final FetchingStatus fetchingStatus;
  final List<PokemonEntity> pokemonList;
  final bool isLoadingMore;
  final int selectedIndex;

  final int limit = 20;
  final int page;

  int get offset => (page + 1) * limit;
  PokemonEntity get selectedPokemon => pokemonList[selectedIndex];

  factory PokemonListState.initial() => const PokemonListState(
        fetchingStatus: FetchingStatus.initial,
        pokemonList: [],
        isLoadingMore: false,
        selectedIndex: 0,
        page: 0,
      );

  PokemonListState copyWith({
    FetchingStatus? fetchingStatus,
    List<PokemonEntity>? pokemonList,
    bool? isLoadingMore,
    int? selectedIndex,
    int? page,
  }) {
    return PokemonListState(
      fetchingStatus: fetchingStatus ?? this.fetchingStatus,
      pokemonList: pokemonList ?? this.pokemonList,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props {
    return [
      fetchingStatus,
      pokemonList,
      isLoadingMore,
      selectedIndex,
      page,
    ];
  }
}

part of 'pokemon_list_bloc.dart';

sealed class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonListEvent extends PokemonListEvent {}

class GetMorePokemonListEvent extends PokemonListEvent {}

class SelectPokemonEvent extends PokemonListEvent {
  final int index;

  const SelectPokemonEvent(this.index);
}

class AddPokemonToFavoriteEvent extends PokemonListEvent {
  final int index;

  const AddPokemonToFavoriteEvent(this.index);
}

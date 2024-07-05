import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/move_entity.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/stat_entity.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/type_entity.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final int height;
  final int weight;
  final String imageUrl;
  final List<StatEntity> stats;
  final List<MoveEntity> moves;
  final List<TypeEntity> types;
  final bool isFavorite;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.imageUrl,
    required this.stats,
    required this.moves,
    required this.types,
    this.isFavorite = false,
  });

  String get heightInMts => (height / 10).toStringAsFixed(1);
  String get weightInKgs => (weight / 10).toStringAsFixed(1);

  Color get color {
    final principalType = types.first.name;

    switch (principalType) {
      case 'grass':
        return const Color(0xff78C850);
      case 'bug':
        return const Color(0xff2CDAB1);
      case 'fire':
        return const Color(0xffF7786B);
      case 'water':
        return const Color(0xff58ABF6);
      case 'fighting':
        return const Color(0xffFA6555);
      case 'normal':
        return const Color(0xffA8A878);
      case 'electric':
        return const Color(0xffFFCE4B);
      case 'psychic':
        return const Color(0xffEE99AC);
      case 'poison':
        return const Color(0xff9F5BBA);
      case 'ghost':
        return const Color(0xff7C538C);
      case 'ground':
        return const Color(0xff51382E);
      case 'rock':
        return const Color(0xffCA8179);
      case 'dark':
        return const Color(0xff303943);
      case 'dragon':
        return const Color.fromARGB(208, 112, 56, 248);
      case 'fairy':
        return const Color(0xffF85888);
      case 'flying':
        return const Color(0xffA890F0);
      case 'ice':
        return const Color(0xff98D8D8);
      case 'steel':
        return const Color.fromARGB(99, 48, 57, 67);
      default:
        return const Color(0xffF85888);
    }
  }

  PokemonEntity copyWith({
    int? id,
    String? name,
    int? height,
    int? weight,
    String? imageUrl,
    List<StatEntity>? stats,
    List<MoveEntity>? moves,
    List<TypeEntity>? types,
    bool? isFavorite,
  }) {
    return PokemonEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      imageUrl: imageUrl ?? this.imageUrl,
      stats: stats ?? this.stats,
      moves: moves ?? this.moves,
      types: types ?? this.types,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory PokemonEntity.fromMap(Map<String, dynamic> map) {
    return PokemonEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      height: map['height'] as int,
      weight: map['weight'] as int,
      imageUrl: map['sprites']['other']['official-artwork']['front_default']
          as String,
      stats: List<StatEntity>.from(
        (map['stats']).map<StatEntity>(
          (x) => StatEntity.fromMap(Map<String, dynamic>.from(x)),
        ),
      ),
      moves: List<MoveEntity>.from(
        (map['moves']).map<MoveEntity>(
          (x) => MoveEntity.fromMap(Map<String, dynamic>.from(x)),
        ),
      ),
      types: List<TypeEntity>.from(
        (map['types']).map<TypeEntity>(
          (x) => TypeEntity.fromMap(Map<String, dynamic>.from(x)),
        ),
      ),
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      height,
      weight,
      imageUrl,
      stats,
      moves,
      types,
      isFavorite,
    ];
  }
}

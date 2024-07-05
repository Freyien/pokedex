import 'package:equatable/equatable.dart';

class MoveEntity extends Equatable {
  final String name;

  const MoveEntity({
    required this.name,
  });

  MoveEntity copyWith({
    String? name,
  }) {
    return MoveEntity(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory MoveEntity.fromMap(Map<String, dynamic> map) {
    return MoveEntity(
      name: map['move']['name'] as String,
    );
  }

  @override
  List<Object> get props => [name];
}

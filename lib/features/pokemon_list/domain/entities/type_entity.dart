import 'package:equatable/equatable.dart';

class TypeEntity extends Equatable {
  final String name;
  const TypeEntity({
    required this.name,
  });

  TypeEntity copyWith({
    String? name,
  }) {
    return TypeEntity(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory TypeEntity.fromMap(Map<String, dynamic> map) {
    return TypeEntity(
      name: map['type']['name'] as String,
    );
  }

  @override
  List<Object> get props => [name];
}

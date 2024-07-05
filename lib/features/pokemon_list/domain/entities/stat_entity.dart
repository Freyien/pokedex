import 'package:equatable/equatable.dart';

class StatEntity extends Equatable {
  final int base;
  final String name;
  const StatEntity({
    required this.base,
    required this.name,
  });

  StatEntity copyWith({
    int? base,
    String? name,
  }) {
    return StatEntity(
      base: base ?? this.base,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'base': base,
      'name': name,
    };
  }

  factory StatEntity.fromMap(Map<String, dynamic> map) {
    return StatEntity(
      base: map['base_stat'] as int,
      name: map['stat']['name'] as String,
    );
  }

  @override
  List<Object> get props => [base, name];
}

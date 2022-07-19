import 'dart:convert';

import 'package:equatable/equatable.dart';


class CounterState extends Equatable {
  int count;
  bool wasIncremented;

  CounterState({
    required this.count,
    this.wasIncremented = false,
  });
  
  @override
  List<Object?> get props => [count, wasIncremented];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      count: map['count'] as int,
      wasIncremented: map['wasIncremented'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) => CounterState.fromMap(json.decode(source) as Map<String, dynamic>);
}

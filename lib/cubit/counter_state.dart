part of 'counter_cubit.dart';

class CounterState  extends Equatable {
  int count;
  bool wasIncremented;

  CounterState({
    required this.count,
    this.wasIncremented = false,
  });
  
  @override
  List<Object?> get props => [count, wasIncremented];
}

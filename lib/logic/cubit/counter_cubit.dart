import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:learn_bloc/logic/cubit/counter_state.dart';



class CounterCubit extends HydratedCubit<CounterState>{

  CounterCubit() : super(CounterState(count: 0));

  void increment() =>
      emit(CounterState(count: state.count + 1, wasIncremented: true));
  void decrement() => emit(CounterState(count: state.count - 1));

  @override
  Future<void> close() {
    return super.close();
  }
  
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}

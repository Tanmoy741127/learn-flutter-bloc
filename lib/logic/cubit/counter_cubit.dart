import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_bloc/logic/cubit/internet_cubit.dart';

import '../../constants/enums.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit() : super(CounterState(count: 0));


  void increment() =>
      emit(CounterState(count: state.count + 1, wasIncremented: true));
  void decrement() => emit(CounterState(count: state.count - 1));

  @override
  Future<void> close() {
    return super.close();
  }
}

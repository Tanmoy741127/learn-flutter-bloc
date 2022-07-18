import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_bloc/logic/cubit/internet_cubit.dart';

import '../../constants/enums.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit}) : super(CounterState(count: 0)) {
    monitorInternetConnection();
  }

  StreamSubscription<InternetState> monitorInternetConnection() {
    return internetStreamSubscription = internetCubit.stream.listen((internetState) {
    if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.Wifi) {
      increment();
    } else if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.Mobile) {
      decrement();
    }
  });
  }

  void increment() =>
      emit(CounterState(count: state.count + 1, wasIncremented: true));
  void decrement() => emit(CounterState(count: state.count - 1));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}

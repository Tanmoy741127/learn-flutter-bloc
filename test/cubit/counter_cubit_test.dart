import 'package:flutter_test/flutter_test.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';

void main() {
  group('CounterBit', (){
    late CounterCubit counterCubit;

    setUp((){
      counterCubit = CounterCubit();
    });

    tearDown((){
      counterCubit.close();
    });

    test('the initial state for counter is 0', (){
      expect(counterCubit.state.count, 0);
    });
  });
}
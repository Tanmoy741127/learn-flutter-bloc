import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    
    blocTest<CounterCubit, CounterState>(
      'the cubit should emit [CounterState(counter:1, wasIncremented: true)] when cubit.increment() is called.',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: ()=> [CounterState(count: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit [CounterState(counter:1, wasIncremented: false)] when cubit.decrement() is called.',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: ()=> [CounterState(count: -1, wasIncremented: false)],
    );
  });
}
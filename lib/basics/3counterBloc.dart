import 'package:bloc/bloc.dart';

abstract class CounterEvent {}
class CounterIncrement extends CounterEvent {}
class CounterDecrement extends CounterEvent {}



class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0){
      on<CounterIncrement>((event, emit) => emit(state + 1));
    on<CounterDecrement>((event, emit) => emit(state - 1));
  }
}

void main(List<String> args) {
  final bloc = CounterBloc();
  bloc.stream.listen((data) {
    print("Received data : "+ data.toString());
  });

  bloc.add(CounterIncrement());
  bloc.add(CounterIncrement());
  bloc.add(CounterIncrement());
  bloc.add(CounterIncrement());
  bloc.add(CounterDecrement());
  bloc.add(CounterDecrement());
  bloc.add(CounterDecrement());
  bloc.add(CounterIncrement());
}
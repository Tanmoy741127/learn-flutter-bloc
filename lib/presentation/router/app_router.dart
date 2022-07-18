import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(
              title: "Screen 1",
            ),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(
              title: "Screen 2",
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdScreen(
              title: "Screen 3",
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(
              title: "Screen 1",
            ),
          ),
        );
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}

import 'package:flutter/material.dart';

import '../../logic/cubit/counter_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter{

  
  Route onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            title: "Screen 1",
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => SecondScreen(
            title: "Screen 2",
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => ThirdScreen(
            title: "Screen 3",
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            title: "Screen 1",
          ),
        );
    }
  }


}
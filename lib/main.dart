import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/cubit/internet_cubit.dart';
import 'package:learn_bloc/presentation/router/app_router.dart';
import 'package:learn_bloc/presentation/screens/second_screen.dart';
import 'package:learn_bloc/presentation/screens/third_screen.dart';

import '/logic/cubit/counter_cubit.dart';
import 'presentation/screens/home_screen.dart';

void main() {

  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity ;

  MyApp({super.key, required this.connectivity, required this.appRouter});



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity)
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(internetCubit: BlocProvider.of<InternetCubit>(context)),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: appRouter.onGenerateRoute),
    );
  }
}

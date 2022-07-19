import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:learn_bloc/logic/cubit/internet_cubit.dart';
import 'package:learn_bloc/presentation/router/app_router.dart';
import 'package:path_provider/path_provider.dart';

import '/logic/cubit/counter_cubit.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    ()=>  runApp(MyApp(
      appRouter: AppRouter(),
      connectivity: Connectivity(),
    )),
    storage: storage
  );

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
          create: (context) => CounterCubit(),
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

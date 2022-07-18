import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/cubit/internet_cubit.dart';
import 'package:learn_bloc/presentation/screens/second_screen.dart';

import '/logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("BUILD HUHU");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state){
                if(state is InternetConnected){
                  return Text("Connected to ${state.connectionType}");
                }else if(state is InternetDisconnected){
                  return Text("Disconnected");
                }else{
                  return Text("Loading");
                }
              }
            ),
            const Text(
              'COUNTER VALUE:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) => {
                if (state.wasIncremented == true)
                  {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Counter incremented'),
                        ),
                      )
                  }
              },
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: "Decrement",
                  heroTag: "1",
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: "Increment",
                  heroTag: "2",
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).pushNamed("/second");
              },
              child: Text("Go to screen 2"),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).pushNamed("/third");
              },
              child: Text("Go to screen 3"),
            ),
          ],
        ),
      ),
    );
  }
}

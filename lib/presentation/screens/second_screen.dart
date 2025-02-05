import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/presentation/screens/third_screen.dart';

import '../../logic/cubit/counter_state.dart';
import '/logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {
    print("BUILD SECOND");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'COUNTER VALUE:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) => {
                if(state.wasIncremented == true) {
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
                  tooltip: "Decrement2",
                  heroTag: "11",
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: "Increment2",
                  heroTag: "12",
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 50,),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context2) => BlocProvider.value(
                      value: BlocProvider.of<CounterCubit>(context),
                      child: ThirdScreen(title: 'Screen 3'),
                    ),
                  ),
                );
              },
              child: Text("Go to screen 3"),
            )
          ],
        ),
      ),
    );
  }
}

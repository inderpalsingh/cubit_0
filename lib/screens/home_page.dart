import 'package:cubit_0/cubit/counter_cubit.dart';
import 'package:cubit_0/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('Main build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder<CounterCubit, int>(
            BlocBuilder<CounterCubit, CounterState>(
              
              builder: (_, state) {
                print('BlocBuilder build ${state.count}');
                if(state.isLoading) {
                  return const CircularProgressIndicator();
                }else {
                  return Text('${state.count}', style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30));
                }
             },)
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).incrementCount();
              // context.read<CounterCubit>().incrementCount();
            },
            child: const Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrementCount();
              // context.read<CounterCubit>().incrementCount();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

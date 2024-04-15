import 'dart:async';

import 'package:cubit_0/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit() : super(CounterState(count: 0, isLoading: false));

  //// events

  void incrementCount() {
    emit(CounterState(count: state.count, isLoading: true));
    Timer(const Duration(seconds: 3), () {
      emit(CounterState(count: state.count + 1, isLoading: false));
    });
  }

  //// events
  void decrementCount() {
    if (state.count > 0) {
      emit(CounterState(count: state.count, isLoading: true));
      Timer(const Duration(seconds: 3), () {
        emit(CounterState(count: state.count - 1, isLoading: false));
      });
    }
  }


}

 ////// 2nd

/*class CounterCubit extends Cubit<CounterState>{

  CounterCubit(): super(CounterState(count: 0));

  //// events

  void incrementCount(){
    emit(CounterState(count: state.count +1));

  }

  //// events
  void decrementCount(){

    if(state.count > 0 ){
      emit(CounterState(count: state.count - 1));
    }

  }

}*/



////// 1st

/*
class CounterCubit extends Cubit<int>{

  CounterCubit(): super(0);


  //// events

  void incrementCount(){

    emit(state + 1);

  }

  //// events

  void decrementCount(){

    if(state >0 ){
      emit(state - 1);
    }

  }

}*/

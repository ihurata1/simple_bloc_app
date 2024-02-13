import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_app/bloc/counter/event.dart';
import 'package:simple_bloc_app/bloc/counter/state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;

  CounterBloc() : super(InitialState()) {
    on<NumberIncreaseEvent>(onNumberIncrease);
    on<NumberDecreaseEvent>(onNumberDecrease);
  }

  void onNumberIncrease(NumberIncreaseEvent event, Emitter<CounterStates> emit) async {
    counter = counter + 1;
    emit(UpdateState(counter));
  }

  void onNumberDecrease(NumberDecreaseEvent event, Emitter<CounterStates> emit) async {
    counter = counter - 1;
    emit(UpdateState(counter));
  }
}

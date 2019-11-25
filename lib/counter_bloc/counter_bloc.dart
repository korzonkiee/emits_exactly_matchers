import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _counter = 0;

  @override
  CounterState get initialState => InitialCounterState();

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Increment) {
      _counter++;
      yield CounterIncremented();
    } else if (event is Decrement) {
      _counter--;
      yield CounterDecremented();
    }
  }
}

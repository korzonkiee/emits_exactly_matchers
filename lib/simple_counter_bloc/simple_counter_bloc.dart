import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class SimpleCounterBloc extends Bloc<SimpleCounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(
    SimpleCounterEvent event,
  ) async* {
    switch (event) {
      case SimpleCounterEvent.increment:
        yield state + 1;
        break;
      case SimpleCounterEvent.decrement:
        yield state - 1;
        break;
      default:
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:emits_exactly_matchers/counter_bloc/bloc.dart';
import 'package:emits_exactly_matchers/simple_counter_bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> emitsExactly<B extends Bloc<dynamic, State>, State>(
  B bloc,
  Iterable matchers,
) async {
  assert(bloc != null);
  final states = <State>[];
  final subscription = bloc.listen(states.add);
  await bloc.close();
  expect(states, matchers);
  subscription.cancel();
}

void main() {
  group('Counter bloc tests', () {
    test('Should increment', () async {
      final counterBloc = CounterBloc();

      counterBloc.add(Increment());

      await emitsExactly(counterBloc, [
        isA<InitialCounterState>(),
        isA<CounterIncremented>(),
      ]);
    });
  });

  group('Simple counter bloc tests', () {
    test('Should increment', () async {
      final counterBloc = SimpleCounterBloc();

      counterBloc.add(SimpleCounterEvent.increment);

      await emitsExactly(counterBloc, [0, 1]);
    });
  });
}

import 'package:meta/meta.dart';

@immutable
abstract class CounterState {}

class InitialCounterState extends CounterState {}

class CounterIncremented extends CounterState {}

class CounterDecremented extends CounterState {}

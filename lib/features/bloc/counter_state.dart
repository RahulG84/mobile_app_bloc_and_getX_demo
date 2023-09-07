part of 'counter_bloc.dart';

@immutable
 class CounterState {
  int counter;
  CounterState({required this.counter});
}

final class CounterInitial extends CounterState {
CounterInitial():super(counter:0);
}
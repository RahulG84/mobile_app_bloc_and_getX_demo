import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>(incrementEvent);
    on<DecrementEvent>(decrementEvent);
  }

  FutureOr<void> incrementEvent(
      IncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(counter: state.counter + 1));
  }

  FutureOr<void> decrementEvent(
      DecrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(counter: state.counter - 1));
  }
}

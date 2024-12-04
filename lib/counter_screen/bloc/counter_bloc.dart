import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<OnIncrementEvent>((event, emit) {
      emit(CounterState(count: ++state.count));
    });

    on<OnDecrementEvent>((event, emit) {
      emit(CounterState(count: --state.count));
    });
  }
}

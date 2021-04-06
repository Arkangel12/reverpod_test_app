import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterModel {
  final int value;

  CounterModel(this.value);

  CounterModel copyWith(int value) => CounterModel(value);
}

class CounterState extends StateNotifier<CounterModel> {
  CounterState() : super(CounterModel(0));

  void increment() => state = state.copyWith(state.value + 1);

  void decrement() => state = state.copyWith(state.value - 1);
}

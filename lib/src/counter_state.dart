import 'package:flutter_riverpod/all.dart';

class CounterState extends StateNotifier<int> {
  CounterState() : super(0);

  void increment() => state++;

  void decrement() => state--;
}
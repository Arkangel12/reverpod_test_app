
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState extends StateNotifier<int> {
  CounterState() : super(0);

  void increment() => state++;

  void decrement() => state--;
}
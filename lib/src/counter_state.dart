
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterModel extends StateNotifier<int> {
  CounterModel() : super(0);

  void increment() => state++;

  void decrement() => state--;
}
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_test_app/src/constants.dart';
import 'package:riverpod_test_app/src/counter_state.dart';
import 'package:riverpod_test_app/src/theme_change_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

final darkTheme = StateProvider<bool>((ref) => false);

final counterState =
    StateNotifierProvider<CounterState>((ref) => CounterState());

final searchProvider = StateProvider((ref) => '');

final namesProvider = StateProvider<List<String>>((ref) {
  final search = ref.watch(searchProvider).state;
  return listOfNames
      .where((element) => element.toLowerCase().contains(search))
      .toList();
});

final sharedPreferences =
    FutureProvider<SharedPreferences>((ref) => SharedPreferences.getInstance());

final themeChangeNotifier = ChangeNotifierProvider<ThemeChangeNotifier>((ref) {
  final prefs = ref.watch(sharedPreferences)?.data?.value;
  return ThemeChangeNotifier(prefs);
});
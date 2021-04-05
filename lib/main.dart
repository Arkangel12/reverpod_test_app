import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/src/providers.dart';
import 'package:riverpod_test_app/src/search_page.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final prefs = watch(sharedPreferences);

    return prefs.when(
      loading: () => Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      data: (data) {
        final isDartTheme = watch(themeChangeNotifier).isDarkTheme;
        return MaterialApp(
          title: 'Flutter Demo',
          theme: isDartTheme ? ThemeData.dark() : ThemeData.light(),
          home: SearchPage(),
        );
      },
      error: (e, s) => Material(
        child: Center(
          child: Text(e.toString()),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_test_app/src/providers.dart';
import 'package:riverpod_test_app/src/search_page.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isDartTheme = watch(darkTheme).state;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDartTheme ? ThemeData.dark() : ThemeData.light(),
      // home: MyHomePage(title: 'Riverpod'),
      home: SearchPage(),
    );
  }
}

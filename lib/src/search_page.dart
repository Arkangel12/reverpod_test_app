import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_test_app/src/providers.dart';

class SearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final search = watch(searchProvider);
    final names = watch(namesProvider).state;
    final isDartTheme = watch(themeChangeNotifier).isDarkTheme;
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (val) => search.state = val,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.palette),
            // onPressed: () => context.read(darkTheme).state = !context.read(darkTheme).state,
            onPressed: () => context.read(themeChangeNotifier).setTheme(!isDartTheme),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: names.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (_, index) => ListTile(
          title: Text(names[index]),
        ),
      ),
    );
  }
}

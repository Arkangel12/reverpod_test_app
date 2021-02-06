import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final darkTheme = StateProvider<bool>((ref) => false);
final counterState =
StateNotifierProvider<CounterState>((ref) => CounterState());

class CounterState extends StateNotifier<int> {
  CounterState() : super(0);

  void increment() => state++;
}

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

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, watch, child) {
                final counter = watch(counterState.state);
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            RaisedButton(
              onPressed: () => context.read(darkTheme).state =
              !context.read(darkTheme).state,
              child: Text('Change Theme'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read(counterState).increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

final searchProvider = StateProvider((ref) => '');
final namesProvider = StateProvider<List<String>>((ref) {
  final search = ref.watch(searchProvider).state;
  return listOfNames
      .where((element) => element.toLowerCase().contains(search))
      .toList();
});

class SearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final search = watch(searchProvider);
    final names = watch(namesProvider).state;
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (val) => search.state = val,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.palette),
            onPressed: () =>
            context.read(darkTheme).state = !context.read(darkTheme).state,
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

final listOfNames = <String>[
  'Liam',
  'Noah',
  'Oliver',
  'William ',
  'Elijah',
  'James',
  'Benjamin',
  'Lucas',
  'Mason',
  'Ethan',
  'Alexander',
  'Henry',
  'Jacob',
  'Michael',
  'Daniel',
  'Logan',
  'Jackson',
  'Sebastian',
  'Jack',
  'Aiden',
  'Owen',
  'Samuel',
  'Matthew',
  'Joseph',
  'Levi',
  'Mateo',
  'David',
  'John',
  'Wyatt',
  'Carter',
  'Julian',
  'Luke',
  'Grayson',
  'Isaac',
  'Jayden',
  'Theodore',
  'Gabriel',
  'Anthony',
  'Dyln',
  'Leo',
  'Lincoln',
  'Jaxon',
  'Asher',
  'Christopher',
  'Josiah',
  'Andrew',
  'Thomas',
  'Joshua',
  'Ezra',
  'Hudson',
  'Charles',
  'Caleb',
  'Isaiah',
  'Ryan',
  'Nathan',
  'Adrian',
  'Christian',
  'Maverick',
  'Colton',
  'Elias',
  'Aaron',
  'Eli',
  'Landon',
  'Jonathan',
  'Nolan',
  'Hunter',
  'Cameron',
  'Connor',
  'Santiago',
  'Jeremiah',
  'Ezekiel',
  'Angel',
  'Roman',
  'Easton',
  'Miles',
  'Robert',
  'Jameson',
  'Nicholas',
  'Greyson',
  'Cooper',
  'Ian',
  'Carson',
  'Axel',
  'Jaxson',
  'Dominic',
  'Leonardo',
  'Luca',
  'Austin',
  'Jordan',
  'Adam',
  'Xavier',
  'Jose',
  'Jace',
  'Everett',
  'Declan',
  'Evan',
  'Kayden',
  'Parker',
  'Wesley',
  'Kai',
  'Brayden',
  'Bryson',
  'Weston',
  'Jason',
  'Emmett',
  'Sawyer',
  'Silas',
  'Bennett',
  'Brooks',
  'Micah',
  'Damian',
  'Harrison',
  'Waylon',
  'Ayden',
  'Vincent',
  'Ryder',
  'Kingston',
  'Rowan',
  'George',
  'Luis',
  'Chase',
  'Cole',
  'Nathaniel',
  'Zachary',
  'Ashton',
  'Braxton',
  'Gavin',
  'Tyler',
  'Diego',
  'Bentley',
  'Amir',
  'Beau',
  'Gael',
  'Carlos',
  'Ryker',
  'Jasper',
  'Max',
  'Juan',
  'Ivan',
  'Brandon',
  'Jonah',
  'Giovanni',
  'Kaiden',
  'Myles',
  'Calvin',
  'Lorenzo',
  'Maxwell',
  'Jayce',
  'Kevin',
  'Legend',
];


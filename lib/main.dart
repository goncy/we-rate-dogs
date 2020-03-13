import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './app/pages/loading.dart';
import './dog/context.dart';
import './dog/pages/add.dart';
import './dog/pages/list.dart';

void main() => runApp(App());

/// App component
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<DogContext>(
      create: (context) => DogContext(initialize: true),
      child: MaterialApp(
          theme: ThemeData(
              brightness: Brightness.dark, primarySwatch: Colors.deepOrange),
          initialRoute: '/',
          routes: {
            '/': (context) => Provider.of<DogContext>(context).isLoading
                ? LoadingPage()
                : ListPage(),
            '/add': (context) => AddPage(),
          }));
}

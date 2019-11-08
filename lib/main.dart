import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './app/pages/loading.dart';
import './dog/context.dart';
import './dog/pages/add.dart';
import './dog/pages/list.dart';

void main() => runApp(ChangeNotifierProvider<DogContext>(
    builder: (context) => DogContext(initialize: true), child: App()));

/// App component
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Provider.of<DogContext>(context).isLoading
          ? LoadingPage()
          : MaterialApp(
              theme: ThemeData(
                brightness: Brightness.light,
              ),
              initialRoute: '/',
              routes: {
                  '/': (context) => HomePage(),
                  '/add': (context) => AddPage(),
                });
}

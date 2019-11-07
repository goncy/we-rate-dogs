import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './contexts/dog.dart';
import './pages/add.dart';
import './pages/home.dart';
import './pages/loading.dart';

void main() => runApp(ChangeNotifierProvider<DogContext>(
    builder: (context) => DogContext(), child: App()));

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

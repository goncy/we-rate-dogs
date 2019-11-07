import 'package:flutter/material.dart';

import "models/dog.dart";
import "resources/dog.dart";
import 'pages/home.dart';
import 'pages/add.dart';
import 'pages/loading.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final DogResource resource = DogResource();

  bool isLoading = true;
  List<Dog> dogs = [];

  Future initialize() async {
    try {
      var dogs = await resource.list();

      setState(() {
        this.dogs = dogs;
        this.isLoading = false;
      });
    } catch (exception) {
      print(exception);
    }
  }

  void add(Dog dog) => setState(() => this.dogs.add(dog));

  @override
  void initState() {
    super.initState();

    this.initialize();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
          theme: ThemeData(
              brightness: Brightness.light, primarySwatch: Colors.deepOrange),
          initialRoute: '/',
          routes: {
            '/': (context) =>
                this.isLoading ? LoadingPage() : HomePage(this.dogs),
            '/add': (context) => AddPage(this.add)
          });
}

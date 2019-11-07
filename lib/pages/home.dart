import 'package:flutter/material.dart';

import '../models/dog.dart';
import '../components/dog_card.dart';

class HomePage extends StatelessWidget {
  HomePage(this.dogs);

  final List<Dog> dogs;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("We rate dogs"), actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/add'),
          ),
        ]),
        body: ListView.builder(
          itemCount: this.dogs.length,
          itemBuilder: (context, int) => DogCard(this.dogs[int]),
        ),
      );
}

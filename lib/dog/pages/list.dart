import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/card.dart';
import '../context.dart';

/// Home page
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dogs = Provider.of<DogContext>(context).dogs;

    return Scaffold(
      appBar: AppBar(title: Text("We rate dogs"), actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, '/add'),
        ),
      ]),
      body: ListView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, int) => DogCard(dogs[int]),
      ),
    );
  }
}

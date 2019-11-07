import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_rate_dogs/contexts/dog.dart';

import '../components/dog_card.dart';

class HomePage extends StatelessWidget {
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

import 'package:flutter/widgets.dart';

import '../resources/dog.dart';
import '../models/dog.dart';

class DogContext with ChangeNotifier {
  final DogResource resource = DogResource();

  bool isLoading = true;
  List<Dog> dogs = [];

  DogContext() {
    this.fetch();
  }

  Future fetch() async {
    try {
      var dogs = await resource.list();

      this.dogs = dogs;
      this.isLoading = false;

      notifyListeners();
    } catch (exception) {
      print(exception);
    }
  }

  void add(Dog dog) {
    dogs.add(dog);

    notifyListeners();
  }

  void rate(Dog dog, int rating) {
    dog.rating = rating;

    notifyListeners();
  }
}

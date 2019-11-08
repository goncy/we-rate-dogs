import 'package:flutter/widgets.dart';

import '../models/dog.dart';
import '../resources/dog.dart';

/// Dog context
class DogContext with ChangeNotifier {
  final DogResource _resource = DogResource();

  /// Dog context loading status
  bool isLoading = false;

  /// Dogs list
  List<Dog> dogs = [];

  /// Fetch on initialize
  DogContext({initialize = false}) {
    if (initialize) _fetch();
  }

  Future _fetch() async {
    try {
      isLoading = true;

      var dogs = await _resource.list();

      this.dogs = dogs;

      isLoading = false;

      notifyListeners();
    } catch (exception) {
      print(exception);
    }
  }

  /// Adds a dog
  void add(Dog dog) {
    dogs.add(dog);

    notifyListeners();
  }

  /// Rates a dog
  void rate(Dog dog, int rating) {
    dog.rating = rating;

    notifyListeners();
  }
}

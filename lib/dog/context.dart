import 'package:flutter/widgets.dart';

import './model.dart';
import './resources.dart';

/// Dog context
class DogContext extends ChangeNotifier {
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

      notifyListeners();

      dogs = await _resource.list();
      isLoading = false;

      notifyListeners();
    } on Exception catch (exception) {
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

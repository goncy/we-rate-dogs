import 'dart:convert';
import 'dart:io';

import "../models/dog.dart";

class DogResource {
  final Uri _uri = Uri.https('api.myjson.com', '/bins/13cx4g');
  final HttpClient _http = HttpClient();

  List<Dog> _parse(dynamic dogs) => List<Dog>.from(
        dogs.map(
          (dog) => Dog(
            name: dog['name'],
            location: dog['location'],
            description: dog['description'],
            image: dog['image'],
          ),
        ),
      );

  Future<List<Dog>> list() async {
    var request = await _http.getUrl(_uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    return _parse(json.decode(responseBody));
  }
}

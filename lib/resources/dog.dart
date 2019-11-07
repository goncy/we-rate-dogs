import 'dart:convert';
import 'dart:io';

import "../models/dog.dart";

class DogResource {
  final Uri uri = Uri.https('api.myjson.com', '/bins/13cx4g');
  final HttpClient http = HttpClient();

  Future list() async {
    var request = await http.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    return Dog.fromJsonList(json.decode(responseBody));
  }
}

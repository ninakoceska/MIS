import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mis_lab_2/models/joke.dart';

class apiServ {
  static const String url = "https://official-joke-api.appspot.com";

  Future<List<String>> getTypes() async {
    var r = await http.get(Uri.parse('$url/types'));
    if (r.statusCode == 200) {
      List<dynamic> types = json.decode(r.body);
      return types.cast<String>();
    }
    throw Exception('Cannot load types');
  }

  Future<List<Joke>> getJokeOfType(String type) async {
    var r = await http.get(Uri.parse('$url/jokes/$type/ten'));
    if (r.statusCode == 200) {
      List<dynamic> jokes = json.decode(r.body);
      return jokes.map((joke) => Joke.fromJson(joke)).toList();
    }
    throw Exception('Cannot load jokes');
  }

  Future<Joke> RandomJoke() async {
    var response = await http.get(Uri.parse('$url/random_joke'));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    }
    throw Exception('Failed to load random joke');
  }
}

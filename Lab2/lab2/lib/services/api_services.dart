import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lab2/models/joke.dart';

class ApiService {
  static const String url = "https://official-joke-api.appspot.com";

  Future<List<String>> JokeType() async {
    var x = await http.get(Uri.parse('$url/types'));
    if (x.statusCode == 200) {
      List<dynamic> list = json.decode(x.body);

      return list.cast<String>();
    }
    throw Exception('Cannot load joke types');
  }

  Future<List<Joke>> JokesByType(String type) async {
    var x = await http.get(Uri.parse('$url/jokes/$type/ten'));
    if (x.statusCode == 200) {
      List<dynamic> list = json.decode(x.body);
      return list.map((joke) => Joke.fromJson(joke)).toList();
    }
    throw Exception('Cannot load jokes');
  }

  Future<Joke> RandomJoke() async {
    var x = await http.get(Uri.parse('$url/random_joke'));
    if (x.statusCode == 200) {
      return Joke.fromJson(json.decode(x.body));
    }
    throw Exception('Cannot load random joke');
  }
}

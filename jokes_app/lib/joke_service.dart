import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class JokeService {
  Future<List<String>> fetchJokes() async {
    try {
      var response =
          await Dio().get('https://v2.jokeapi.dev/joke/Any?amount=3');
      if (response.statusCode == 200) {
        var data = response.data;
        List<String> fetchedJokes = [];
        for (var joke in data['jokes']) {
          if (joke['type'] == 'single') {
            fetchedJokes.add(joke['joke']);
          } else {
            fetchedJokes.add('${joke['setup']} ${joke['delivery']}');
          }
        }
        return fetchedJokes;
      } else {
        throw Exception('Failed to load jokes');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to load jokes');
    }
  }
}

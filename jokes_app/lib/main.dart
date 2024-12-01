import 'package:flutter/material.dart';
import 'joke_service.dart';
import 'joke_list.dart';
import 'generate_jokes_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: JokesAppMainPage(),
    );
  }
}

class JokesAppMainPage extends StatefulWidget {
  @override
  _JokesAppMainPageState createState() => _JokesAppMainPageState();
}

class _JokesAppMainPageState extends State<JokesAppMainPage> {
  List<String> jokes = ["", "", ""];

  Future<void> fetchJokes() async {
    JokeService jokeService = JokeService();
    try {
      List<String> fetchedJokes = await jokeService.fetchJokes();
      setState(() {
        jokes = fetchedJokes;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes App'),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to the jokes app!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Click the button below to generate a joke!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                GenerateJokesButton(onPressed: fetchJokes),
              ],
            ),
            JokeList(jokes: jokes),
          ],
        ),
      ),
    );
  }
}
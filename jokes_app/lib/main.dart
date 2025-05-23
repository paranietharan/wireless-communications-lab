import 'package:flutter/material.dart';
import 'joke_service.dart';
import 'joke_list.dart';
import 'generate_jokes_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const JokesAppMainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JokesAppMainPageState createState() => _JokesAppMainPageState();
}

class _JokesAppMainPageState extends State<JokesAppMainPage> {
  List<String> jokes = [];
  bool isLoading = false;

  Future<void> fetchJokes() async {
    setState(() {
      isLoading = true;
    });

    JokeService jokeService = JokeService();
    try {
      List<String> fetchedJokes = await jokeService.fetchJokes();
      setState(() {
        jokes = fetchedJokes;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Welcome to the jokes app!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Click the button below to generate a joke!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            GenerateJokesButton(onPressed: fetchJokes),
            const SizedBox(height: 20),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Expanded(child: JokeList(jokes: jokes)),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: JokesAppMainPage(), // Remove const keyword here
    );
  }
}

class JokesAppMainPage extends StatefulWidget {
  const JokesAppMainPage({super.key});

  @override
  _JokesAppMainPageState createState() => _JokesAppMainPageState();
}

class _JokesAppMainPageState extends State<JokesAppMainPage> {
  List<String> jokes = ["", "", ""];

  Future<void> fetchJokes() async {
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
        setState(() {
          jokes = fetchedJokes;
        });
      }
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
                TextButton(
                  onPressed: fetchJokes,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.grey),
                    padding:
                        WidgetStateProperty.all(const EdgeInsets.all(10.0)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Generate Jokes',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (var joke in jokes)
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        joke,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

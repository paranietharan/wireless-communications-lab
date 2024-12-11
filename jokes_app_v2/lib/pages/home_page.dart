import 'package:flutter/material.dart';
import '../model/joke.dart';
import '../services/joke_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final JokeService _jokeService = JokeService();
  List<Joke> jokes = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    loadJokes();
  }

  Future<void> loadJokes() async {
    setState(() => _isLoading = true);
    try {
      final loadedJokes = await _jokeService.getCachedJokes();
      setState(() => jokes = loadedJokes);
    } catch (e) {
      print('Error loading jokes: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> fetchJokes() async {
    setState(() => _isLoading = true);
    try {
      final newJokes = await _jokeService.fetchJokes();
      setState(() => jokes = newJokes);
    } catch (e) {
      print('Error fetching jokes: $e');
      final cachedJokes = await _jokeService.getCachedJokes();
      setState(() => jokes = cachedJokes);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : jokes.isEmpty
                      ? Center(child: Text('No jokes available'))
                      : ListView.builder(
                          itemCount: jokes.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  jokes[index].fullJoke,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          },
                        ),
            ),
            ElevatedButton(
              onPressed: fetchJokes,
              child: Text('Fetch More Jokes'),
            ),
          ],
        ),
      ),
    );
  }
}
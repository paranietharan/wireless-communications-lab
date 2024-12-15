import 'package:flutter/material.dart';
import '../model/joke.dart';

class JokeCard extends StatelessWidget {
  final Joke joke;
  final int index;

  const JokeCard({
    Key? key,
    required this.joke,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Joke #${index + 1}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 10),
            Text(
              joke.fullJoke,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue.shade800,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {
                    // action when 2 press heart
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share, color: Colors.blue.shade900),
                  onPressed: () {
                    // action when 2 press share
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
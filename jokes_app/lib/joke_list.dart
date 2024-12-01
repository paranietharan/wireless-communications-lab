import 'package:flutter/material.dart';

class JokeList extends StatelessWidget {
  final List<String> jokes;

  const JokeList({Key? key, required this.jokes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              jokes[index],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}
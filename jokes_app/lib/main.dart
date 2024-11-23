import 'package:flutter/material.dart';
import 'package:jokes_app/jokes_app_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      home: JokesAppMainPage(),
    );
  }
}
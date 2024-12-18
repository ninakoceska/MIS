import 'package:flutter/material.dart';
import 'package:lab2/screens/homeScr.dart';
import 'package:lab2/screens/randomJokeScr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lab2',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: "/",
      routes: {
        "/": (context) => Index(),
        "/random_joke": (context) => RandomJoke(),
      },
    );
  }
}

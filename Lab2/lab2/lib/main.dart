import 'package:flutter/material.dart';
import 'package:mis_lab_2/screens/index.dart';
import 'package:mis_lab_2/screens/joke-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mis_lab_2',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: "/",
      routes: {
        "/": (context) => IndexScreen(),
        "/random_joke": (context) => RandomJokeScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lab2/screens/jokeListScr.dart';

class JokeTypeCard extends StatelessWidget {
  final String type;

  const JokeTypeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Card(
            borderOnForeground: true,
            elevation: 5,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => JokeListScreen(type: type),
                ),
              ),
              child: SizedBox(
                  height: 50,
                  child: Center(
                      child: Text(
                    type.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ))),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

import '../models/joke.dart';

class JCard extends StatefulWidget {
  final Joke joke;

  const JCard({super.key, required this.joke});

  @override
  JCardState createState() => JCardState();
}

class JCardState extends State<JCard> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Card(
            borderOnForeground: true,
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () => setState(() => show = !show),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.joke.textA,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (show) ...[
                      Text(
                        widget.joke.textB,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(225, 112, 67, 143),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

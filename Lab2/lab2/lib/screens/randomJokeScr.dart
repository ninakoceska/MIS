import 'package:flutter/material.dart';
import 'package:lab2/models/joke.dart';
import 'package:lab2/services/api_services.dart';
import 'package:lab2/widgets/card.dart';

class RandomJoke extends StatelessWidget {
  final ApiService apiService = ApiService();

  RandomJoke({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 111, 59, 156),
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.lightBlue,
              size: 24,
            )),
        title: const Text(
          'Random Joke',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<Joke>(
          future: apiService.RandomJoke(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: JCard(joke: snapshot.data!),
              ),
            );
          }),
    );
  }
}

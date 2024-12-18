import 'package:flutter/material.dart';
import 'package:lab2/services/api_services.dart';
import 'package:lab2/widgets/joke_type_card.dart';

class Index extends StatelessWidget {
  final ApiService apiS = ApiService();

  Index({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 111, 59, 156),
          title: const Text(
            'Joke Types',
            style: TextStyle(color: Colors.lightBlue),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "/random_joke"),
              icon: const Icon(Icons.shuffle),
              color: Colors.lightBlue[100],
            )
          ],
        ),
        body: FutureBuilder<List<String>>(
            future: apiS.JokeType(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No content avaliable'));
              }

              return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(17, 199, 15, 35),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return JokeTypeCard(type: snapshot.data![index]);
                  });
            }));
  }
}

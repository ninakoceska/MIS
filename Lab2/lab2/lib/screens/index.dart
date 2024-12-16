import 'package:flutter/material.dart';
import 'package:mis_lab_2/services/api_services.dart';
import 'package:mis_lab_2/widgets/type.dart';

class IndexScreen extends StatelessWidget {
  final apiServ apiService = apiServ();

  IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(225, 112, 67, 143),
          title: const Text(
            'Joke Types',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "/random_joke"),
              icon: const Icon(Icons.shuffle),
              color: Colors.lightBlue,
            )
          ],
        ),
        body: FutureBuilder<List<String>>(
            future: apiService.getTypes(),
            builder: (c, s) {
              if (s.hasError) {
                return Center(child: Text('Error: ${s.error}'));
              }
              if (s.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!s.hasData || s.data!.isEmpty) {
                return const Center(child: Text('No joke types available'));
              }

              return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 200, 16, 36),
                  itemCount: s.data!.length,
                  itemBuilder: (context, index) {
                    return JokeTypeCard(type: s.data![index]);
                  });
            }));
  }
}

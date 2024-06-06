import 'package:flutter/material.dart';
import 'package:friendfindr_flutter/screens/favorites_screen.dart';
import 'package:friendfindr_flutter/screens/people_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Image.network(
              'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQNi7gboKdqLUnTNY-3otcDiWvZ4aTWAeyuqOwdJ0WQPqgABXT9'),
          const Text(
            'FriendFindr',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueGrey),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PeopleScreen()));
              },
              child: const Text('Personas'),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueGrey),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoritesScreen()));
              },
              child: const Text('Favoritos'),
            ),
          ),
        ],
      ),
    )));
  }
}

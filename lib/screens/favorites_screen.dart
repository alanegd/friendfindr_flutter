import 'package:flutter/material.dart';
import 'package:friendfindr_flutter/models/person.dart';
import 'package:friendfindr_flutter/screens/widgets/people_list.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Person> people = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PeopleList(people: people),
            ),
          ],
        ),
      ),
    );
  }
}

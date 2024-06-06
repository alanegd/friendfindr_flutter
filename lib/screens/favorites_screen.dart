import 'package:flutter/material.dart';
import 'package:friendfindr_flutter/models/person.dart';
import 'package:friendfindr_flutter/screens/widgets/people_list.dart';
import 'package:friendfindr_flutter/dao/person_dao.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Person> people = [];
  final PersonDao personDao = PersonDao();

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  void fetchFavorites() async {
    List<Person> allPeople = await personDao.getAll();
    setState(() {
      people = allPeople;
    });
  }

  void toggleFavorite(Person person) async {
    bool isFav = await personDao.isFavorite(person);
    if (isFav) {
      await personDao.delete(person);
    } else {
      await personDao.insert(person);
    }
    setState(() {
      person.isFavorite = !isFav;
      fetchFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PeopleList(
                people: people,
                onFavoriteToggled: toggleFavorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

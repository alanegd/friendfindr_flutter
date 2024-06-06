import 'package:flutter/material.dart';
import 'package:friendfindr_flutter/models/person.dart';
import 'package:friendfindr_flutter/screens/widgets/person_card.dart';

class PeopleList extends StatelessWidget {
  final List<Person> people;
  final Function(Person) onFavoriteToggled;

  const PeopleList({
    super.key,
    required this.people,
    required this.onFavoriteToggled,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: PersonCard(
            person: people[index],
            onFavoriteToggled: onFavoriteToggled,
          ),
        );
      },
    );
  }
}

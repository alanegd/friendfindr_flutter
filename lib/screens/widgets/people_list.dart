import 'package:flutter/material.dart';
import 'package:friendfindr_flutter/models/person.dart';
import 'package:friendfindr_flutter/screens/widgets/person_card.dart';

class PeopleList extends StatelessWidget {
  final List<Person> people;
  const PeopleList({super.key, required this.people});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: PersonCard(
              thumbnail: people[index].picture.thumbnail,
              title: people[index].name.title,
              first: people[index].name.first,
              last: people[index].name.last,
              gender: people[index].gender,
              city: people[index].location.city,
              email: people[index].email,
              cell: people[index].cell,
            ));
      },
    );
  }
}

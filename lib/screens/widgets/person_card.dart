import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String first;
  final String last;
  final String gender;
  final String city;
  final String email;
  final String cell;

  const PersonCard({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.first,
    required this.last,
    required this.gender,
    required this.city,
    required this.email,
    required this.cell,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(thumbnail),
        title: Text('$title $first $last'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gender: $gender'),
            Text('City: $city'),
            Text('Email: $email'),
            Text('Phone Number: $cell'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:friendfindr_flutter/models/person.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  final Function(Person) onFavoriteToggled;

  const PersonCard({
    Key? key,
    required this.person,
    required this.onFavoriteToggled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(person.picture.thumbnail),
        title: Text(
            '${person.name.title} ${person.name.first} ${person.name.last}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gender: ${person.gender}'),
            Text('City: ${person.location.city}'),
            Text('Email: ${person.email}'),
            Text('Phone Number: ${person.cell}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            person.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: person.isFavorite ? Colors.red : null,
          ),
          onPressed: () => onFavoriteToggled(person),
        ),
      ),
    );
  }
}

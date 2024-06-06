class Name {
  final String first;
  final String last;
  final String title;

  const Name({
    required this.first,
    required this.last,
    required this.title,
  });

  Name.fromJson(Map<String, dynamic> json)
      : first = json['first'],
        last = json['last'],
        title = json['title'];
}

class Picture {
  final String thumbnail;

  const Picture({
    required this.thumbnail,
  });

  Picture.fromJson(Map<String, dynamic> json) : thumbnail = json['thumbnail'];
}

class Location {
  final String city;

  const Location({
    required this.city,
  });

  Location.fromJson(Map<String, dynamic> json) : city = json['city'];
}

class Person {
  bool isFavorite;
  final String id;
  final Picture picture;
  final Name name;
  final String email;
  final String cell;
  final String title;
  final String gender;
  final Location location;

  Person({
    required this.isFavorite,
    required this.id,
    required this.picture,
    required this.name,
    required this.email,
    required this.cell,
    required this.title,
    required this.gender,
    required this.location,
  });

  Person.fromJson(Map<String, dynamic> map)
      : isFavorite = map['isFavorite'] == 1,
        id = map['id']?['value'] ?? '',
        picture = Picture.fromJson(map['picture']),
        name = Name.fromJson(map['name']),
        email = map['email'] ?? '',
        cell = map['cell'] ?? '',
        title = map['name']?['title'] ?? '',
        gender = map['gender'] ?? '',
        location = Location.fromJson(map['location']);

  Map<String, dynamic> toMap() {
    return {
      'isFavorite': isFavorite ? 1 : 0,
      'id': id,
      'thumbnail': picture.thumbnail,
      'first': name.first,
      'last': name.last,
      'email': email,
      'cell': cell,
      'title': title,
      'gender': gender,
      'city': location.city,
    };
  }

  static Person fromMap(Map<String, dynamic> map) {
    return Person(
        isFavorite: map['isFavorite'] == 1,
        id: map['id'] ?? '',
        picture: Picture(thumbnail: map['thumbnail'] ?? ''),
        name: Name(
            first: map['first'] ?? '',
            last: map['last'] ?? '',
            title: map['title'] ?? ''),
        email: map['email'] ?? '',
        cell: map['cell'] ?? '',
        title: map['title'] ?? '',
        gender: map['gender'] ?? '',
        location: Location(city: map['city'] ?? ''));
  }
}

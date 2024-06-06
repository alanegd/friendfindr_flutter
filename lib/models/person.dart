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
  final Picture picture;
  final Name name;
  final String email;
  final String cell;
  final String title;
  final String gender;
  final Location location;

  const Person({
    required this.picture,
    required this.name,
    required this.email,
    required this.cell,
    required this.title,
    required this.gender,
    required this.location,
  });

  Person.fromJson(Map<String, dynamic> json)
      : picture = Picture.fromJson(json['picture']),
        name = Name.fromJson(json['name']),
        email = json['email'],
        cell = json['cell'],
        title = json['name']['title'],
        gender = json['gender'],
        location = Location.fromJson(json['location']);
}

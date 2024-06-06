import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:friendfindr_flutter/models/person.dart';

class PersonService {
  final String baseUrl = "https://randomuser.me/api/";

  Future<List<Person>> searchPeople(int count) async {
    http.Response response =
        await http.get(Uri.parse("$baseUrl?results=$count"));
    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseMap = json.decode(response.body);
      List<dynamic> results = responseMap["results"];
      return results.map((map) => Person.fromJson(map)).toList();
    } else {
      print("Error: ${response.statusCode}");
    }
    return [];
  }
}

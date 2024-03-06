import 'dart:ffi';

import 'package:first_app/Models/User.dart';
import 'package:first_app/Models/user_dob.dart';
import 'package:first_app/Models/user_location.dart';
import 'package:http/http.dart' as http;
import 'package:first_app/Models/user_name.dart';
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List;
    final users = results.map((e) {
      final UserName userName = UserName(
        title: e["name"]["title"],
        first: e["name"]["first"],
        last: e["name"]["last"],
      );
      final dob = UserDob(
        date: DateTime.parse(e["dob"]["date"]),
        age: e["dob"]["age"],
      );

     
      final LocationStreet street = LocationStreet(number:e["location"]["street"]["number"], name: e["location"]["street"]["name"]);
      final LocationCoordinates coordinates = LocationCoordinates(latitude: e["location"]["coordinates"]["latitude"], longitude: e["location"]["coordinates"]["longitude"]);
      final LocationTimezone timezone = LocationTimezone(offset: e["location"]["timezone"]["offset"], description: e["location"]["timezone"]["description"]);
      
      final location = UserLocation(city: e["location"]["city"], state: e["location"]["state"], country: e["location"]["country"], postcode: e["location"]["postcode"], street: street, coordinates: coordinates, timezone: timezone);

      return User(
        email: e["email"],
        gender: e["gender"],
        phone: e["phone"],
        cell: e["cell"],
        nat: e["nat"],
        name: userName,
        dob: dob,
        location: location,
      );
    }).toList();
    return users;
  }
}

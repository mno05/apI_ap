import 'package:first_app/Models/user_dob.dart';
import 'package:first_app/Models/user_location.dart';
import 'package:first_app/Models/user_name.dart';

class User {
  final String email;
  final String gender;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  User({
    required this.email,
    required this.gender,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,

  });

  String get fullName{
    return "${this.name.title} ${this.name.first} ${this.name.last}";
  }
}


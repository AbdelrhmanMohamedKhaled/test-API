import 'package:apitest_app/model/user_dob.dart';
import 'package:apitest_app/model/user_location.dart';
import 'package:apitest_app/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;

  User({
    required this.phone,
    required this.cell,
    required this.nat,
    required this.gender,
    required this.email,
    required this.name,
    required this.dob,
    required this.location,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last']);
    final date = e['dob']['date'];
    final dob = UserDob(
      age: e['dob']['age'],
      date: DateTime.parse(date),
    );
    final coordinates = LocationCoordenate(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude']);
    final street = LocationStreet(
        name: e['location']['street']['name'],
        number: e['location']['street']['number']);
    final timezone = LocationTimezoneCoordenate(
        description: e['location']['timezone']['description'],
        offset: e['location']['timezone']['offset']);
    final location = UserLocation(
      city: e['location']['city'],
      state: e['location']['state'],
      country: e['location']['country'],
      postcode: e['location']['postcode'].toString(),
      street: street,
      coordinates: coordinates,
      timezone: timezone,
    );
    return User(
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      gender: e['gender'],
      email: e['email'],
      name: name,
      dob: dob,
      location: location,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}

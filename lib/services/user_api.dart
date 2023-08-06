import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/user.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=25'));
    final json = jsonDecode(response.body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}

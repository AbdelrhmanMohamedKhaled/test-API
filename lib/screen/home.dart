import 'package:apitest_app/model/user.dart';
import 'package:apitest_app/services/user_api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rest API call',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final color = user.gender == 'male' ? Colors.blue : Colors.pink;
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.location.city),
            textColor: color,
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}

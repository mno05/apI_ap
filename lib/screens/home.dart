import 'package:first_app/Models/User.dart';
import 'package:first_app/services/user_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test API"),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                // final imgUrl = user["picture"]["thumbnail"];
                return ListTile(
                  trailing: Text('${user.dob.age}'),
                  // leading:ClipRRect(
                  //   borderRadius: BorderRadius.circular(20),
                  //   child: Image.network(imgUrl),
                  // ),
                  title: Text(user.fullName),
                  subtitle: Text(user.email),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: Icon(Icons.view_agenda),
      ),
    );
  }

  Future<void> fetchUsers() async {
    final data = await UserApi.fetchUsers();
    setState(() {
      users = data;
    });
  }
}

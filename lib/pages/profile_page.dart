import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("ziasnsdiwecd@gmail.com"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.facebook),
            title: Text("Facebook"),
            subtitle: Text("ziasnsdiwecd"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.mobile_friendly),
            title: Text("Mobile phone"),
            subtitle: Text("012893938"),
          ),
        ],
      ),
    );
  }
}
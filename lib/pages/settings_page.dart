import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // كل واحدة من دول هي state - قيمة بتتغير والشاشة بترسم نفسها تاني لما تتغير
  bool darkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            secondary: const Icon(Icons.dark_mode_outlined),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text("Notifications"),
            secondary: const Icon(Icons.notifications_outlined),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/login",
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

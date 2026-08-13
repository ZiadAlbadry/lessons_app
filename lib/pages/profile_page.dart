import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ProfileLeading(),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.email),
              title: const Text("Email"),
              subtitle: const Text("ziadalbadry16@gmail.com"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.mobile_screen_share_outlined),
              title: const Text("Mobile"),
              subtitle: const Text("01285964248"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.facebook),
              title: const Text("Facebook"),
              subtitle: const Text("ziadalbadry16@gmail.com"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.camera_enhance_outlined),
              title: const Text("Creativa"),
              subtitle: const Text("zezoalbadry.com"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileLeading extends StatelessWidget {
  const ProfileLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color.fromARGB(255, 27, 73, 152), Color.fromARGB(255, 65, 223, 131)],
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        spacing: 20,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
              ),
              const Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const Icon(Icons.settings, size: 25, color: Colors.white),
            ],
          ),

          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 220, 227, 230),
            radius: 73,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                "https://ziadalbadry.github.io/portfolio/img/ziadsisi.jpg"
              ),
            ),
          ),

          const Column(
            children: [
              Text(
                "Ziad Albadry",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Senior Flutter Developer",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("1800", style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(width: 5),
              Text("Followers", style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(width: 10),
              SizedBox(
                height: 40,
                child: VerticalDivider(color: Colors.white, thickness: 1.5),
              ),
              SizedBox(width: 10),
              Text("1200", style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(width: 5),
              Text("Following", style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
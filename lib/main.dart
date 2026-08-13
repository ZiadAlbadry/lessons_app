import 'package:flutter/material.dart';
import 'package:lessons_app/pages/login_page.dart';
import 'package:lessons_app/pages/profile_page.dart';
import 'package:lessons_app/pages/home_page.dart';
import 'package:lessons_app/pages/splash_page.dart';

void main(List<String> args) {
  runApp(const VerveApp());
}

class VerveApp extends StatelessWidget {
  const VerveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
        "/profile": (context) => const ProfilePage(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const NotFound404()),
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorSchemeSeed: Colors.deepPurpleAccent,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Cairo',
        colorSchemeSeed: Colors.deepPurpleAccent,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}

class NotFound404 extends StatelessWidget {
  const NotFound404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sorry 404", style: TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/home",
                  (route) => false,
                );
              },
              child: const Text("Go Home"),
            ),
          ],
        ),
      ),
    );
  }
}
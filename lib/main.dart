import 'package:flutter/material.dart';
import 'package:untitled/registration_page.dart';
import 'welcome_page.dart';
import 'login_page.dart';
import 'registration_page.dart';
import 'navigation_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:{
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/registration': (context) => const RegistrationPage(),
        '/navigation': (context) => const NavigationPage(),
      }
    );
  }
}
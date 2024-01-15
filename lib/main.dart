import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/registration_screen.dart';
import 'pages/welcome_screen.dart';
import 'pages/login_screen.dart';
import 'pages/navigation_screen.dart';
import 'pages/pets_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyCXWx205p0yW9hpMmxs0uOTZdSOCh_n698',
              appId: '1:244911606193:android:8cb01e01d4a3e7320a5590',
              messagingSenderId: '244911606193',
              projectId: 'petadoption-158ed'))
      : await Firebase.initializeApp();
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
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/registration': (context) => const RegistrationPage(),
        '/navigation': (context) => const NavigationPage(),
        '/petlist': (context) => PetsListPage(),
      },
    );
  }
}

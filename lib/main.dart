import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/main_page.dart';
import 'package:untitled/pages/registration_page.dart';
import 'pages/welcome_page.dart';
import 'pages/login_page.dart';
import 'pages/slide_page.dart';
import 'pages/search_page.dart';
import 'pages/recommendations_page.dart';
import 'pages/favorites_page.dart';
import 'pages/profile_page.dart';
import 'pages/adoption/adoption_page.dart';


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
        '/slide_page': (context) => const SlidePage(),
        '/profile': (context) => ProfilePage(),
        '/search': (context) => SearchPage(),
        '/adoption': (context) => AdoptionPage(),
        '/favorites': (context) => FavoritesPage(),
        '/recommendations': (context) => RecommendationsPage(),
        '/main_page': (context) => MainScreen(),
      },
    );
  }
}

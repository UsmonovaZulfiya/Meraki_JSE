import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/dto/user.dart';
import 'package:untitled/pages/Wrapper.dart';
import 'package:untitled/pages/main_page.dart';
import 'package:untitled/pages/authenticate/registration_page.dart';
import 'package:untitled/service/authentication_service.dart';
import 'pages/authenticate/welcome_page.dart';
import 'pages/authenticate/login_page.dart';
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
  final AuthService authService = AuthService(); // Create an instance of AuthService
  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService; // Declare a final variable for AuthService

  const MyApp({super.key, required this.authService}); // Accept it in the constructor

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: authService.user, // Use the instance to get the user stream
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/welcome': (context) => const WelcomePage(),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/dto/user.dart';
import 'package:untitled/pages/authenticate/welcome_page.dart';
import 'package:untitled/pages/main_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print("Wrapper: Received user: $user");

    if (user == null) {
      return const WelcomePage();
    } else {
      return MainPage();
    }
  }
}

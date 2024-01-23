import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/dto/user.dart';
import 'package:untitled/pages/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);
    print(user);

    return Authenticate();
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../dto/user.dart';
import '../../service/authentication_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Future<void> _login() async {
  //   try {
  //     await _authService.login(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );
  //     // Navigate to the next screen or perform any other actions
  //     Navigator.pushNamed(context, '/main_page');
  //   } catch (e) {
  //     print(e.toString());
  //     // Handle and display errors to the user
  //   }
  // }

  Future<void> _login() async {
    try {
      MyUser? user = await _authService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Check if the user is not null
      if (user != null) {
        // Navigate to the main page if login is successful
        print("Success");
        Navigator.pushNamed(context, '/main_page');
      } else {
        // Handle the situation where the user object is null
        // This could happen if the login method is modified to return null upon failure
        print('Login failed: User is null');
      }
    } catch (e) {
      print(e.toString());
      // Handle and display errors to the user
      // Ideally, you would use a more user-friendly way to show the error, like a dialog or a snackbar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(70, 112, 112, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android, //Change to logo
              size: 100,
            ),

            //Hello again!
            const Text(
              'Hello Again!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome back!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 50),

            //email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Enter Your Email'),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            //password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    //Used for passwords, so we can not see password
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Password'),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            //sign in button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)),
                child: TextButton(
                  onPressed: () {
                    _login();
                  },
                  child: const Text(
                    '         Log in         ',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 112, 112, 1.0), // Text color
                      fontSize: 18.0, // Font size
                      fontWeight: FontWeight.bold, // Font weight
                      letterSpacing: 1.2, // Letter spacing
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            //register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Do not have an account?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 12.0, // Font size
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

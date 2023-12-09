import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key : key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(70, 112, 112, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone_android, //Change to logo
              size: 100,
            ),

            //Hello again!
            Text(
              'Hello Again!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome back!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            SizedBox(height: 50),

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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Email'
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

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
                    obscureText: true, //Used for passwords, so we can not see password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Password'
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            //sign in button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)
                ),

                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/navigation');
                    },
                    child: Text(
                      '         Log in         ',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 112, 112, 1.0), // Text color
                        fontSize: 18.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                        letterSpacing: 1.2, // Letter spacing
                      ),

                    )
                ),

              ),
            ),


            SizedBox(height: 25),

            //register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Do not have an account?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 12.0, // Font size
                      ),

                    )
                ),
              ],
            )

          ],),
      ),
    );
  }
}


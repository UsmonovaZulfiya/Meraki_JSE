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
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //Hello again!
          Text(
              'Hello Again!',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36)
            ,
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
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Center(
                  child: Text(
                      'Sign in',
                    style: TextStyle(
                        color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
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
              Text(' Register Now ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
              )
            ],
          )

        ],),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget{
  const WelcomePage({Key? key}) : super(key : key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(70, 112, 112, 1.0),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36),
            ),
            SizedBox(height: 10),
            Text(
              'Some text....',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            SizedBox(height: 90),

            Center(
              child: Icon(
                Icons.phone_android,
                color: Colors.white,//Change to logo
                size: 170,
              ),
            ),

            SizedBox(height: 80),

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
                      Navigator.pushNamed(context, '/login');
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

            SizedBox(height: 10),

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
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: Text(
                        '    Registration    ',
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
        ],
      ),
    ),
    );
  }
}
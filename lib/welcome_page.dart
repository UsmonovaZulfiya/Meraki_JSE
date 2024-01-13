import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget{
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(70, 112, 112, 1.0),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36),
            ),
            const SizedBox(height: 10),
            const Text(
              'Some text....',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 90),

            const Center(
              child: Icon(
                Icons.phone_android,  //Change to logo
                size: 170,
              ),
            ),

            const SizedBox(height: 80),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)
                ),

                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
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

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)
                ),

                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: const Text(
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

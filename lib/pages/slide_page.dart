import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SlidePage extends StatefulWidget {
  const SlidePage({Key? key}) : super(key: key);

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(70, 112, 112, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTextButton('Profile', FontAwesomeIcons.user, '/profile'),
            buildTextButton('Search', FontAwesomeIcons.search, '/search'),
            buildTextButton('Adoption', FontAwesomeIcons.paw, '/adoption'),
            buildTextButton('Favorites', FontAwesomeIcons.heart, '/favorites'),
            buildTextButton('Recommendations', FontAwesomeIcons.solidStar, '/recommendations'),
          ],
        ),
      ),
    );
  }

  Widget buildTextButton(String text, IconData iconData, String route) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Column(
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 30.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPage extends StatefulWidget{
  const NavigationPage({Key? key}) : super(key : key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color.fromRGBO(70, 112, 112, 1.0),
    body: Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 20.0,
              ),
              child: Row(
                children: <Widget> [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.grey,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      'User Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget>  [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: <Widget> [
                      Icon(
                        FontAwesomeIcons.search,
                        color: Colors.white,
                      ),
                      Text(
                        ' Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: <Widget> [
                      Icon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.white,
                      ),
                      Text(
                        ' Reccomendations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: <Widget> [
                      Icon(
                        FontAwesomeIcons.paw,
                        color: Colors.white,
                      ),
                      Text(
                        ' Adoption',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: <Widget> [
                      Icon(
                        FontAwesomeIcons.heart,
                        color: Colors.white,
                      ),
                      Text(
                        ' Favorites',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: <Widget> [
                      Icon(
                        FontAwesomeIcons.user,
                        color: Colors.white,
                      ),
                      Text(
                        ' Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 20.0,
              ),
              child: Row(
                children: <Widget> [
                  Icon(
                    FontAwesomeIcons.cog,
                    color: Colors.white,
                  ),
                  Text(
                    ' Settings | Log out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

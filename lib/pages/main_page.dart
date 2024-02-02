import 'package:flutter/material.dart';
import 'package:untitled/pages/recommendation/category_page.dart';
import 'package:untitled/pages/user_profile_page.dart';
import 'adoption/add_pet_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    MainPageContent(), // The main page content extracted to a new widget
    AdoptionInputPage(),
    UserProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          // If not on the Home page, navigate back to Home page.
          setState(() {
            _selectedIndex = 0;
          });
          return false; // Prevent exiting the app.
        } else {
          // On Home page, allow exiting the app.
          return true;
        }
      },
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Pet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({super.key});

  void navigateToCategoryPage(BuildContext context, String category) {
    final routeName = '/$category'; // Construct the route name dynamically
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Adoption'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/search'); // Implement search action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Categories',
                  style: Theme.of(context).textTheme.headline6),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              // to disable GridView's scrolling
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(8.0),
              children: <Widget>[
                CategoryWidget(
                  title: 'Cats',
                  onTap: () => navigateToCategoryPage(
                      context, 'cat_page'), // For example
                ),
                CategoryWidget(
                  title: 'Dogs',
                  onTap: () => navigateToCategoryPage(
                      context, 'dog_page'), // For example
                ),
                CategoryWidget(
                  title: 'Birds',
                  onTap: () => navigateToCategoryPage(
                      context, 'bird_page'), // For example
                ),
                CategoryWidget(
                  title: 'Other',
                  onTap: () => navigateToCategoryPage(
                      context, 'other_page'), // For example
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Recommendations',
                  style: Theme.of(context).textTheme.headline6),
            ),
            ListTile(
              title: Text('How to take care of cats?'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CareDetailsPage(animalType: 'cats'),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('How to take care of dogs?'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CareDetailsPage(animalType: 'dogs'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CategoryWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Use the passed onTap function
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/widgets/my_pets_card.dart';
import 'package:untitled/widgets/bigger_pet_card_widget.dart';
import 'package:untitled/widgets/rec_button_widget.dart';
import 'package:untitled/pages/adoption/add_pet_page.dart';
import 'package:untitled/pages/user_profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
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
          // appBar: AppBar(
          //   title: const Text('Pet Adoption App'),
          // ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
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

// Extracted main page content into a separate widget
class MainPageContent extends StatelessWidget {
  const MainPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for BiggerPetCard widgets
    List<Map<String, String>> petCardData = [
      {
        'image': 'URL_for_category_image_0',
        'petType': 'Category 0',
      },
      {
        'image': 'URL_for_category_image_1',
        'petType': 'Category 1',
      },
      {
        'image': 'URL_for_category_image_2',
        'petType': 'Category 2',
      },
      {
        'image': 'URL_for_category_image_3',
        'petType': 'Category 3',
      },
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pet Adoption App'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // My Pets Section
                Row(
                  children: [
                    MyPetsCard(
                      imageUrl: 'URL_for_pet_image_1',
                      petName: 'My Pet 1',
                    ),
                    MyPetsCard(
                      imageUrl: 'URL_for_pet_image_2',
                      petName: 'My Pet 2',
                    ),
                    // Add more MyPetsCard widgets as needed
                  ],
                ),
                const SizedBox(height: 16), // Add some spacing between sections

                // Categories Section
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: petCardData.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BiggerPetCard(
                      image: petCardData[index]['imageUrl']!,
                      petType: petCardData[index]['petType']!,
                      onPressed: () {
                        // Navigate to the corresponding page on tap
                        navigateToSpecificPage(context, index);
                      },
                    );
                  },
                ),
                const SizedBox(height: 16), // Add some spacing between sections

                // Recommendations Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommendations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    recButton(
                      buttonText: 'How to take care of cats?',
                      onPressed: () {
                        // Add functionality for the button click
                        Navigator.pushNamed(context, '/recommendations');
                      },
                    ),
                    recButton(
                      buttonText: 'How to take care of dogs?',
                      onPressed: () {
                        // Add functionality for the button click
                        Navigator.pushNamed(context, '/recommendations');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }

  // Keep the navigateToSpecificPage method here if it's still needed

  void navigateToSpecificPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/my_pets_page');
        break;
      case 1:
        Navigator.pushNamed(context, '/my_pets_page');
        break;
      case 2:
        Navigator.pushNamed(context, '/my_pets_page');
        break;
      case 3:
        Navigator.pushNamed(context, '/my_pets_page');
        break;
      default:
      // Handle other cases or provide a default page
        break;
    }
  }
}
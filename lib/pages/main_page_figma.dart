import 'package:flutter/material.dart';
import 'package:untitled/widgets/my_pets_card.dart';
import 'package:untitled/widgets/bigger_pet_card_widget.dart';
import 'package:untitled/widgets/rec_button_widget.dart';

class MainPageFigma extends StatelessWidget {
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
        title: Text('Pet Adoption App'),
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
              SizedBox(height: 16), // Add some spacing between sections

              // Categories Section
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: petCardData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
              SizedBox(height: 16), // Add some spacing between sections

              // Recommendations Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
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
                    },
                  ),
                  recButton(
                    buttonText: 'How to take care of dogs?',
                    onPressed: () {
                      // Add functionality for the button click
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

  // Function to navigate to specific pages based on the index
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

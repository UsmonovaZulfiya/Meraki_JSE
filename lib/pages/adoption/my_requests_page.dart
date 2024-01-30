import 'package:flutter/material.dart';
import 'package:untitled/widgets/pet_card_widget.dart';

class MyRequestsPage extends StatelessWidget {
  final List<Map<String, dynamic>> myPets = [
    // Replace with actual data
    {
      'image': 'pet_image_url_1',
      'name': 'Fluffy',
      'breed': 'Golden Retriever',
      'age': 2,
      'gender': 'Female',
    },
    {
      'image': 'pet_image_url_2',
      'name': 'Buddy',
      'breed': 'Beagle',
      'age': 3,
      'gender': 'Male',
    },
    // Add more pet data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Requests'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two cards in each row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: myPets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to pet profile page using named route and pass pet details as arguments
                    Navigator.pushNamed(
                      context,
                      '/pet_profile',
                      arguments: {
                        'image': myPets[index]['image'],
                        'name': myPets[index]['name'],
                        'breed': myPets[index]['breed'],
                        'age': myPets[index]['age'],
                        'gender': myPets[index]['gender'],
                      },
                    );
                  },
                  child: PetCard(
                    image: myPets[index]['image'],
                    name: myPets[index]['name'],
                    breed: myPets[index]['breed'],
                    age: myPets[index]['age'],
                    gender: myPets[index]['gender'],
                  ),
                );
              },
            ),
          ),

          // Sent and Accept Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Implement logic for Sent button
                  // ...
                },
                child: Text('Sent'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement logic for Accept button
                  // ...
                },
                child: Text('Accepted'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

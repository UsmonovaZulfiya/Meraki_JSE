import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dto/pet.dart';
import '../../dto/user.dart';
import '../../service/database.dart';
import '../../widgets/pet_card_widget.dart';
import '../adoption/pet_details_view_user.dart';
import '../adoption/pet_profile_page.dart';

class BirdPage extends StatefulWidget {
  const BirdPage({super.key});

  @override
  State<BirdPage> createState() => _BirdPageState();
}

class _BirdPageState extends State<BirdPage> {
  @override
  Widget build(BuildContext context) {

    final String? userUid = Provider.of<MyUser?>(context, listen: false)?.uid;

    DatabaseService? dbService;

    if (userUid != null) {
      dbService = DatabaseService(uid: userUid);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Birds'),
      ),
      body: FutureBuilder<List<Pet>>(
        future: dbService?.fetchPetsByCategory('Bird'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No birds available for adoption'));
          } else {
            List<Pet> pets = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as needed
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8, // Adjust the card's aspect ratio as needed
              ),
              padding: EdgeInsets.all(8),
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final Pet pet = pets[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetProfilePageView(petId: pet.id), // Assuming `pet.id` holds the pet's ID
                      ),
                    );
                  },
                  child: PetCard(
                    image: pet.photoURL,
                    name: pet.name,
                    breed: pet.breed,
                    age: pet.age,
                    gender: pet.gender,
                  ),
                ); // Your custom PetCardWidget
              },
            );
          }
        },
      ),
    );
  }
}

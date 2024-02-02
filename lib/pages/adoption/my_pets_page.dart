import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/adoption/pet_profile_page.dart';
import 'package:untitled/widgets/pet_card_widget.dart';
import '../../dto/pet.dart';
import '../../dto/user.dart';
import '../../service/database.dart';

class MyPetsPage extends StatefulWidget {
  const MyPetsPage({super.key});

  @override
  State<MyPetsPage> createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetsPage> {
  // Assume currentUserUid is available
  @override
  Widget build(BuildContext context) {
    final String? userUid = Provider.of<MyUser?>(context, listen: false)?.uid;

    DatabaseService? dbService;

    if (userUid != null) {
      dbService = DatabaseService(uid: userUid);
    }

    //TODO: add message showing when there are no pets
    return Scaffold(
      appBar: AppBar(title: const Text('My Pets')),
      body: FutureBuilder<List<Pet>>(
        future: dbService?.fetchUserPets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final pets = snapshot.data ?? [];
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetProfilePage(
                            petId:
                                pet.id), // Assuming `pet.id` holds the pet's ID
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
                );
              },
            );
          }
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/adoption/pet_details_view_user.dart';
import 'package:untitled/pages/adoption/pet_profile_page.dart';
import 'package:untitled/widgets/pet_card_widget.dart';

import '../../dto/pet.dart';
import '../../dto/user.dart';
import '../../service/database.dart';

// class MyPetsPage extends StatelessWidget {
//   final List<Map<String, dynamic>> myPets = [
//     // Replace with actual data
//     {
//       'image': 'pet_image_url_1',
//       'name': 'Fluffy',
//       'breed': 'Golden Retriever',
//       'age': 2,
//       'gender': 'Female',
//     },
//     {
//       'image': 'pet_image_url_2',
//       'name': 'Buddy',
//       'breed': 'Beagle',
//       'age': 3,
//       'gender': 'Male',
//     },
//     // Add more pet data as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Pets'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Two cards in each row
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//         ),
//         itemCount: myPets.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // Navigate to pet profile page using named route and pass pet details as arguments
//               Navigator.pushNamed(
//                 context,
//                 '/pet_profile',
//                 arguments: {
//                   'image': myPets[index]['image'],
//                   'name': myPets[index]['name'],
//                   'breed': myPets[index]['breed'],
//                   'age': myPets[index]['age'],
//                   'gender': myPets[index]['gender'],
//                 },
//               );
//             },
//             child: PetCard(
//               image: myPets[index]['image'],
//               name: myPets[index]['name'],
//               breed: myPets[index]['breed'],
//               age: myPets[index]['age'],
//               gender: myPets[index]['gender'],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
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
                        builder: (context) => PetProfilePage(petId: pet.id), // Assuming `pet.id` holds the pet's ID
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

              // itemBuilder: (context, index) {
              //   final pet = pets[index];
              //   return PetCard(
              //     image: pet.photoURL,
              //     name: pet.name,
              //     breed: pet.breed,
              //     age: pet.age,
              //     gender: pet.gender,
              //   );
              // },
            );
          }
        },
      ),
    );
  }
}

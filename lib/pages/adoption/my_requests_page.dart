import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/adoption/pet_details_view_user.dart';
import 'package:untitled/widgets/my_requests_pet_card.dart';

import '../../dto/pet.dart';
import '../../dto/user.dart';
import '../../service/database.dart';

class MyRequestsPage extends StatefulWidget {
  @override
  State<MyRequestsPage> createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> {


  @override
  Widget build(BuildContext context) {
    final String? userUid = Provider
        .of<MyUser?>(context, listen: false)
        ?.uid;

    DatabaseService? dbService;

    if (userUid != null) {
      dbService = DatabaseService(uid: userUid);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Requests'),
      ),
  //     body: StreamBuilder<QuerySnapshot>(
  //       stream: dbService?.getUserAdoptionRequests(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return CircularProgressIndicator();
  //         } else if (snapshot.hasError) {
  //           return Text('Error: ${snapshot.error}');
  //         } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
  //           return Text('No adoption requests found');
  //         }
  //
  //         var requestsData = snapshot.data!.docs.map((doc) {
  //           var data = doc.data() as Map<String, dynamic>;
  //           return {
  //             'petId': data['petId'] as String,
  //             'requestStatus': data['requestStatus'] as bool,
  //           };
  //         }).toList();
  //
  //         // First, map the snapshot to get a list of pet IDs from the requests
  //         // var petIds = snapshot.data!.docs.map((doc) => doc['petId']).toList();
  //         List<String> petIds = snapshot.data!.docs
  //             .map((doc) => doc.data() as Map<String, dynamic>)
  //             .map((data) => data['petId'] as String)
  //             .toList();
  //         // Now, fetch each pet's data by their ID
  //         return FutureBuilder<List<Pet>>(
  //             // future: dbService?.fetchPetsByIds(petIds), // You'll need to implement this method
  //             future: dbService?.fetchPetsByIds(petIds),
  //             builder: (context, petsSnapshot) {
  //             if (petsSnapshot.connectionState == ConnectionState.waiting) {
  //             return CircularProgressIndicator();
  //             } else if (petsSnapshot.hasError) {
  //             return Text('Error fetching pets: ${petsSnapshot.error}');
  //             } else if (!petsSnapshot.hasData || petsSnapshot.data!.isEmpty) {
  //             return Text('No pets found for your requests');
  //             }
  //             var petsWithRequestStatus = petsSnapshot.data!.asMap().map((index, pet) {
  //             var requestId = requestsData[index]['petId'];
  //             var requestStatus = requestsData.firstWhere((r) => r['petId'] == requestId)['requestStatus'];
  //             return MapEntry(index, {
  //             'pet': pet,
  //             'requestStatus': requestStatus,
  //             });
  //             }).values.toList();
  //
  //             List<Pet> pets = petsSnapshot.data!;
  //
  //           return SingleChildScrollView(
  //           child: GridView.builder(
  //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //               crossAxisSpacing: 8.0,
  //               mainAxisSpacing: 8.0,
  //               ),
  //               itemCount: pets.length,
  //               itemBuilder: (context, index) {
  //               // var request = requests[index];
  //               // bool requestStatus = request['requestStatus'];
  //               var petData = petsWithRequestStatus[index];
  //               Pet pet = petData['pet'];
  //               bool requestStatus = petData['requestStatus'] ?? false;
  //               //final Pet pet = pets[index];
  //               return GestureDetector(
  //                 onTap: () {
  //                 Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                 builder: (context) => PetProfilePageView(petId: pet.id), // Assuming `pet.id` holds the pet's ID
  //                 ),
  //                 );
  //                 },
  //                 child: MyRequestsPetCard(
  //                 image: pet.photoURL,
  //                 name: pet.name,
  //                 breed: pet.breed,
  //                 age: pet.age,
  //                 gender: pet.gender,
  //                 requestSent: true,
  //                 // Assuming requestSent is always true here
  //                 requestAccepted: requestStatus, // This should be determined based on your logic
  //                 ),);
  //                 },
  //                 ),
  //                 );
  //
  //   };
  //   );
  // }

    );}}
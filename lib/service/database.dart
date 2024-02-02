import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/dto/pet.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });
  // collection reference
  final CollectionReference petCollection = FirebaseFirestore.instance.collection('pets');
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String firstName, String lastName, int phoneNumber, String about) async{
    return await userCollection.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'about': about,
    });
  }

  Future addPetData(Pet pet) async{
    return await petCollection.add({
      'name': pet.name,
      'age': pet.age,
      'breed': pet.breed,
      'gender': pet.gender,
      'petType': pet.petType,
      'photo': pet.photoURL,
      'medical_info': pet.medicalInfo,
      'additional_info': pet.addInfo,
      'ownerUID': uid,
    });
  }

  Stream<QuerySnapshot> get pets {
    return petCollection.snapshots();
  }

  Future<List<Pet>> fetchUserPets() async {
    List<Pet> userPets = [];
    try {
      final QuerySnapshot result = await petCollection.where('ownerUID', isEqualTo: uid).get();
      userPets = result.docs.map((doc) => Pet.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      print(e.toString());
    }
    return userPets;
  }

  Future<List<Pet>> fetchPetsByCategory(String category) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pets')
        .where('petType', isEqualTo: category) // Assuming 'petType' is the field for categories
        .get();

    return querySnapshot.docs
        .map((doc) => Pet.fromDocumentSnapshot(doc))
        .toList();
  }

}
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
    return await petCollection.doc(uid).set({
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

}
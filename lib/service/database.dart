import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future updatePetData(String name, String breed, int age, String medical_info, bool gender) async{
    return await petCollection.doc(uid).set({
      'name': name,
      'breed': breed,
      'age': age,
      'medical_info': medical_info,
      'gender': gender,
    });
  }

  Stream<QuerySnapshot> get pets {
    return petCollection.snapshots();
  }

}
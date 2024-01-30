import 'package:cloud_firestore/cloud_firestore.dart';

class Pet {
  String name;
  int age;
  String breed;
  String gender;
  String petType;
  String photoURL;
  String medicalInfo;
  String addInfo;

  Pet({
    required this.name,
    required this.age,
    required this.breed,
    required this.gender,
    required this.petType,
    required this.photoURL,
    required this.medicalInfo,
    required this.addInfo,
  });

  // Constructor that creates a Pet object from a Firestore document
  Pet.fromDocumentSnapshot(DocumentSnapshot doc)
      : name = doc['name'],
        age = doc['age'],
        breed = doc['breed'],
        gender = doc['gender'],
        petType = doc['petType'],
        photoURL = doc['photo'],
        medicalInfo = doc['medical_info'],
        addInfo = doc['additional_info'] {}
    // Initialize other fields based on the document
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Pet {
  String id;
  String name;
  int age;
  String breed;
  String gender;
  String petType;
  String photoURL;
  String medicalInfo;
  String addInfo;

  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.breed,
    required this.gender,
    required this.petType,
    required this.photoURL,
    required this.medicalInfo,
    required this.addInfo,
  });

  Pet.fromDocumentSnapshot(DocumentSnapshot doc)
      : id = doc.id,
        name = doc['name'],
        age = doc['age'],
        breed = doc['breed'],
        gender = doc['gender'],
        petType = doc['petType'],
        photoURL = doc['photo'],
        medicalInfo = doc['medical_info'],
        addInfo = doc['additional_info'] {}
}

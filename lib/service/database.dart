import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/dto/pet.dart';
import 'package:untitled/dto/user_request.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference petCollection =
      FirebaseFirestore.instance.collection('pets');
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference requestCollection =
      FirebaseFirestore.instance.collection('pet_adoption_requests');

  //USER functions
  Future updateUserData(
      String firstName, String lastName, int phoneNumber, String about) async {
    return await userCollection.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'about': about,
    });
  }

  Future<Map<String, dynamic>?> fetchUserData(String uid) async {
    try {
      DocumentSnapshot userDoc = await userCollection.doc(uid).get();
      return userDoc.data() as Map<String, dynamic>?;
    } catch (e) {
      return null;
    }
  }

  Future<UserRequest?> fetchUserById(String userId) async {
    return userCollection
        .doc(userId)
        .get()
        .then((doc) => UserRequest.fromDocumentSnapshot(doc));
  }

  Future<void> updateUserProfileData(String uid, String firstName,
      String lastName, String phoneNumber, String about) async {
    return await userCollection.doc(uid).update({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'about': about,
    });
  }

  //PET functions
  Future addPetData(Pet pet) async {
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
      'adopterUID': null
    });
  }

  Future<List<Pet>> fetchUserPets() async {
    List<Pet> userPets = [];
    try {
      final QuerySnapshot result = await petCollection
          .where('ownerUID', isEqualTo: uid)
          .where('adopterUID', isEqualTo: null)
          .get();
      userPets =
          result.docs.map((doc) => Pet.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      print(e.toString());
    }
    return userPets;
  }

  Future<List<String>> fetchPetAdoptionRequests(
      String petID) async {
    List<String> userIDs = [];
    try {
      final QuerySnapshot result =
          await requestCollection.where('petID', isEqualTo: petID).get();
      userIDs = result.docs.map((doc) => doc['userId'] as String).toList();
    } catch (e) {
      print(e.toString());
    }
    return userIDs;
  }

  Future<Pet> fetchPetByUID(String petUID) async {
    return petCollection
        .doc(petUID)
        .get()
        .then((doc) => Pet.fromDocumentSnapshot(doc));
  }

  Future<List<Pet>> fetchPetsByCategory(String category) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pets')
        .where('petType', isEqualTo: category)
        .get();

    return querySnapshot.docs
        .map((doc) => Pet.fromDocumentSnapshot(doc))
        .toList();
  }

  Future<void> sendAdoptionRequest(String petId, bool requestStatus) async {
    String requestId = petCollection.doc().id;
    await FirebaseFirestore.instance.collection('requests').doc(requestId).set({
      'userId': uid,
      'petId': petId,
      'requestId': requestId,
      'requestStatus': requestStatus,
    });
  }

  Stream<QuerySnapshot> getUserAdoptionRequests() {
    return FirebaseFirestore.instance
        .collection('requests')
        .where('userId', isEqualTo: uid)
        .snapshots();
  }

  Future<List<Pet>> fetchPetsByIds(List<String> petIds) async {
    List<Pet> pets = [];
    for (String id in petIds) {
      var petDoc = await petCollection.doc(id).get();
      if (petDoc.exists) {
        pets.add(Pet.fromDocumentSnapshot(petDoc));
      }
    }
    return pets;
  }

  Future<List<Pet>> fetchPetsByBreed(String breed) async {
    List<Pet> petsByBreed = [];
    try {
      final QuerySnapshot result =
          await petCollection.where('breed', isEqualTo: breed).get();
      petsByBreed =
          result.docs.map((doc) => Pet.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      print(e.toString());
    }
    return petsByBreed;
  }
}

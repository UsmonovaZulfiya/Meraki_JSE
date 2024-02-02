import 'package:cloud_firestore/cloud_firestore.dart';

class PetAdoptionRequest {
  String petID;
  String userID;

  PetAdoptionRequest({
    required this.petID,
    required this.userID,
  });

  PetAdoptionRequest.fromDocumentSnapshot(DocumentSnapshot doc)
      : petID = doc.id,
        userID = doc['userID'];
}

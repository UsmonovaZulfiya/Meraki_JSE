import 'package:cloud_firestore/cloud_firestore.dart';

class UserRequest {
  String email;

  UserRequest({required this.email});

  UserRequest.fromDocumentSnapshot(DocumentSnapshot doc)
      : email = doc['email'];
}

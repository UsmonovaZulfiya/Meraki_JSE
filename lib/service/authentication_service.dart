import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../dto/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // create user object based on FirebaseUser
  MyUser? _userfromFirebase(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // Stream<MyUser?> get user {
  //   return _auth.authStateChanges().map((User? user) => _userfromFirebase(user!));
  // }

  Stream<MyUser?> get user {
    return _auth.authStateChanges()
        .map((User? user) => user != null ? _userfromFirebase(user) : null);
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      // Validate password match
      if (password != confirmPassword) {
        throw FirebaseAuthException(
          code: 'passwords-do-not-match',
          message: 'Passwords do not match',
        );
      }

      // Create user with email and password
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user data to Cloud FireStore
      await _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'about': " ",
      });
    } on FirebaseAuthException catch (e) {
      // Handle errors such as weak password, invalid email, etc.
      //TODO: handling of password mismatch thing
      print('Error during registration: ${e.message}');
      rethrow;
    }
  }

  // Future<void> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     //TODO: handling of this exeption that can be due to invalid email or password
  //     print('Error during login: ${e.message}');
  //     rethrow;
  //   }
  // }

  Future<MyUser?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      //return user; // Return the FirebaseUser object
      return _userfromFirebase(user!);
    } on FirebaseAuthException catch (e) {
      //TODO: handling of this exeption that can be due to invalid email or password
      print('Error during login: ${e.message}');
      rethrow;
    }
  }
}

import 'package:app/authentification/authentification_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final errorHandling = ErrorRegister();

  // Initiate User
  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  // Get User logged
  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  // Function login User
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      errorHandling.setError("none");

      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      return errorHandling.setError(e.message);
    }
  }

  // Function create User
  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String password, String? pseudo}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      errorHandling.setError("none");

      user?.forEach((element) {
        users
            .doc(element!.uid)
            .set({
              'pseudo': pseudo,
              'uid': element.uid,
              'email': element.email,
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      });

      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      return errorHandling.setError(e.message);
    }
  }

  // Function Log out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

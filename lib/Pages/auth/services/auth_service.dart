import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign up
  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        return "Please fill all the fields";
      }
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //store creat user
      await _firestore.collection('users').doc(cred.user!.uid).set({
        'name': name,
        'email': email,
        //'password': password,
        'uid': cred.user!.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });
      //return userCredential.user!.uid;
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  //log in
  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        return "Please fill all the fields";
      }
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "success";
    } catch (e) {
      return e.toString();
    }
  }
  //log out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

final authMethodProvider = Provider<AuthMethod>((ref) {
  return AuthMethod();
});

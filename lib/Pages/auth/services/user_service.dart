// lib/Pages/auth/services/user_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get currently logged-in user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Get extra user details from Firestore
  Future<Map<String, dynamic>?> getUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot =
          await _firestore.collection("users").doc(user.uid).get();

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      }
    }
    return null;
  }
}

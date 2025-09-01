import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool isInitialize = false;

  static Future<void> initialize() async {
    if (!isInitialize) {
      await _googleSignIn.initialize(
        // serverClientId: '762917497944-u38p8rc65c42foqtt3bvbel0afc919u1.apps.googleusercontent.com'
        serverClientId: '762917497944-me4gvl4o8rv6a7dkctkfhb67l6s4sqns.apps.googleusercontent.com'
        // serverClientId: '415416946416-cgsbuuu0od6okouebt92klgns4sc8lup.apps.googleusercontent.com'
      );
    }
    isInitialize = true;
  }
  //Sign in with google
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      initialize();
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      final authorizationClient = googleUser.authorizationClient;
      GoogleSignInClientAuthorization? authorization = await authorizationClient
      .authorizationForScopes(['email', 'profile']);
      final accessToken = authorization?.accessToken;
      if (accessToken == null) {
        final authorization2 = await authorizationClient.authorizationForScopes(
          ['email', 'profile'],
        );
        if (authorization2 ?. accessToken == null) {
          throw FirebaseAuthException(code: "error", message: "error");
        }
        authorization = authorization2;
      }
      final credential = GoogleAuthProvider. credential(
        accessToken: accessToken,
        idToken: idToken,
      );
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        final userDoc = FirebaseFirestore. instance
          .collection('users' )
          .doc(user.uid);
          final docSnapshot = await userDoc.get();
          if (!docSnapshot.exists) {
            await userDoc.set({
              'uid': user.uid,
              'name': user.displayName ?? '',
              'email': user.email ?? '',
              'photoURL': user.photoURL ?? '',
              'provider': 'google',
              'createdAt': FieldValue.serverTimestamp(),
            });
          }
      } return userCredential;
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }
  //sign Out
  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print('error: $e');
      throw e;
    }
  }

  //Get current user
  static User? getCurrentUser() {
    return _auth.currentUser;
  }

}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInService {
//   static final FirebaseAuth _auth = FirebaseAuth.instance;
//   static final GoogleSignIn _googleSignIn = GoogleSignIn();

//   static Future<UserCredential?> signInWithGoogle() async {
//     try {
//       // Google Sign-In
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) return null;

//       // Get token
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       // Firebase credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Sign in with Firebase
//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);

//       final User? user = userCredential.user;

//       // Save in Firestore
//       if (user != null) {
//         final userDoc =
//             FirebaseFirestore.instance.collection('users').doc(user.uid);
//         final doc = await userDoc.get();
//         if (!doc.exists) {
//           await userDoc.set({
//             'uid': user.uid,
//             'name': user.displayName ?? '',
//             'email': user.email ?? '',
//             'photoURL': user.photoURL ?? '',
//             'provider': 'google',
//             'createdAt': FieldValue.serverTimestamp(),
//           });
//         }
//       }

//       return userCredential;
//     } catch (e) {
//       print("Google Sign-In Error: $e");
//       rethrow;
//     }
//   }

//   static Future<void> signOut() async {
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//   }

//   static User? getCurrentUser() => _auth.currentUser;
// }

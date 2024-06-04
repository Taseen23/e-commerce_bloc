import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/src/data/models/user_model.dart';
import 'package:e_commerce_bloc/src/data/preference/local_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

/*
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        // User canceled the sign-in process
        debugPrint("User canceled the signin process.");
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      debugPrint('User: ${authResult.user?.email}');
      debugPrint('User: ${authResult.user?.displayName}');
      
      if (authResult.user != null) {
        await createUserinDB(authResult.user!, null, null, );
      }

      return authResult.user;
    } catch (error) {
      debugPrint("Error signing in with Google: $error");
      return null;
    }
  }
  */

  Future<void> createUserinDB(
      String username, String password, String email) async {
    final data =
        UserModel(userName: username, email: email, password: password);
    await _firestore.collection("Users").doc().set(data.toJson()).then((value) {
      debugPrint("user inserted ${email}");
    });
    LocalPreferences.setString('username', username ?? " ");
    LocalPreferences.setString('email', email ?? " ");
  }

  Future<void> signoutUser() async {
    await _auth.signOut();
  }

  Future<User?> registerwithemail(
      String email, String password, String username) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = credential.user;
      if (user != null) {
        await createUserinDB(username, password, email);
      }
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> signinwithEmail(String email, String Password) async {
    try {
      final UserCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: Password);
      final user = UserCredential.user;
      LocalPreferences.setString('username', user?.displayName ?? " ");
      LocalPreferences.setString('username', user?.email ?? " ");
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}

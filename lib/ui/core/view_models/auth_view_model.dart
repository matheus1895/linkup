import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkup/models/user_model.dart';

class AuthViewModel extends ChangeNotifier {

  var firebaseInstance = FirebaseAuth.instance;

  registerUser(UserModel user) async {
    try {
      var userCredential = await firebaseInstance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (userCredential.user != null) {
        debugPrint(userCredential.user.toString());
        user.id = userCredential.user!.uid;
        user.profileImageUrl = userCredential.user!.photoURL;
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }
    notifyListeners();
  }

  loginUser(UserModel user) async {
    try {
      var userCredential = await firebaseInstance.signInWithEmailAndPassword(
      email: user.email,
      password: user.password
      );
      debugPrint(userCredential.user.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

}

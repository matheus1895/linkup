import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkup/data/models/user_model.dart';
import 'package:linkup/data/repositories/user_repository.dart';

class AuthViewModel extends ChangeNotifier {

  var firebaseInstance = FirebaseAuth.instance;

  final userRepository = UserRepository();

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

      userRepository.saveUser(user);
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

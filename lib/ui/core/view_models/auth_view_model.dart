import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkup/data/models/user_model.dart';
import 'package:linkup/data/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  final firebaseInstance = FirebaseAuth.instance;
  final userRepository = UserRepository();

  Future<void> registerUser(UserModel user) async {
    try {
      var userCredential = await firebaseInstance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );

      if (userCredential.user != null) {
        user.id = userCredential.user!.uid;
        user.profileImageUrl = userCredential.user!.photoURL;

        // Persist user
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', user.id!);
      }

      userRepository.saveUser(user);
    } catch (ex) {
      debugPrint(ex.toString());
    }

    notifyListeners();
  }

  Future<void> loginUser(UserModel user) async {
    try {
      var userCredential = await firebaseInstance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      if (userCredential.user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', userCredential.user!.uid);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    notifyListeners();
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('userId');
  }

  Future<void> logoutUser() async {
    await firebaseInstance.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    notifyListeners();
  }
}

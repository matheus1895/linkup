import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:linkup/data/models/user_model.dart';

class UserRepository {

  var usersCollection = FirebaseFirestore.instance.collection("users");

  saveUser(UserModel user) async {
    try {
      await usersCollection.doc().set(user.toMap());
    } catch (e) {
      debugPrint(e.toString()); 
    }
  }

  getUserById(String id) async {
    var user = usersCollection.where(
      id, 
      isEqualTo: id
    );
    return user;
  }

}
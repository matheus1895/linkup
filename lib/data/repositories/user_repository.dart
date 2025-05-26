import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:linkup/data/models/user_model.dart';

class UserRepository {

  var usersCollection = FirebaseFirestore.instance.collection("users");

  saveUser(UserModel user) async {
    try {
      await usersCollection.doc(user.id.toString()).set(user.toMap());
    } catch (e) {
      debugPrint(e.toString()); 
    }
  }

  Future<UserModel> getUserById(String id) async {
    var users = [];
    await usersCollection.where("id", isEqualTo: id).get().then((val) {
      for (var user in val.docs) {
        var newUser = UserModel.fromMap(user.data());
        users.add(newUser);
      }
    });
    return users.first;
  }
}

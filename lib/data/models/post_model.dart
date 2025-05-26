import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? postId;
  final String userId;
  final String username;
  final String imageUrl;
  final DateTime datePosted;
  final String? userProfileImage;

  PostModel({
    this.postId,
    required this.userId,
    required this.username,
    this.userProfileImage,
    required this.imageUrl,
    required this.datePosted,
  });

  PostModel.fromMap(Map<String, dynamic> map) 
      : postId = map['postId'],
        userId = map['userId'],
        username = map['username'],
        userProfileImage = map['userProfileImage'],
        imageUrl = map['imageUrl'],
        datePosted = (map['datePosted'] as Timestamp).toDate();

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
      'username': username,
      'userProfileImage': userProfileImage,
      'imageUrl': imageUrl,
      'datePosted': datePosted,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linkup/data/models/post_model.dart';

class PostRepository {
  var postsCollection = FirebaseFirestore.instance.collection("posts");

  savePost(PostModel postModel) async {
    try {
      await postsCollection.doc().set(postModel.toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<PostModel> getPostById(String id) async {
    var posts = [];
    await postsCollection.where("postId", isEqualTo: id).get().then((val) {
      for (var post in val.docs) {
        var newPost = PostModel.fromMap(post.data());
        posts.add(newPost);
      }
    });
    return posts.first;
  }

  Future<List<PostModel>> get10PaginatedPosts() async {
    var posts = <PostModel>[];
    await postsCollection.limit(10).orderBy("postId", descending: true).get().then((val) {
      for (var post in val.docs) {
        var newPost = PostModel.fromMap(post.data());
        posts.add(newPost);
      }
    });
    return posts;
  }
}

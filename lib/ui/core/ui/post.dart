import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkup/data/models/post_model.dart';

class Post extends StatelessWidget {
  const Post({super.key, required this.postModel});

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {

    var path2 = XFile(postModel.imageUrl).path;

    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text("${postModel.username}"),
          ),

          Image.file(File(path2)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Postada em ${postModel.datePosted.toString()}'),
          ),

          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
            ],
          ),
        ],
      ),
    );
  }
}

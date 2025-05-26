import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkup/data/models/post_model.dart';
import 'package:linkup/data/repositories/post_repository.dart';
import 'package:linkup/data/repositories/user_repository.dart';
import 'package:linkup/ui/core/themes/theme.dart';
import 'package:linkup/ui/core/ui/post.dart';
import 'package:linkup/ui/feed/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  static var appTheme = LinkupTheme.darkTheme;

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  var imagePicker = ImagePicker();
  var userRepository = UserRepository();
  var postRepository = PostRepository();

  String username = "";

  _postImage(XFile xfile) async {
    var currentUser = await userRepository.getUserById(FirebaseAuth.instance.currentUser!.uid);

    var post = PostModel(
      postId: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: currentUser.id!,
      username: currentUser.username, 
      imageUrl: xfile.path, 
      datePosted: DateTime.now()
      );

    postRepository.savePost(post);

    setState(() {
      username = currentUser.username;
    });
  }

  @override
  Widget build(BuildContext context) {

    var themeViewModel = Provider.of<ThemeViewModel>(context);

    return ListenableBuilder(
      listenable: themeViewModel,
      builder: (context, child)  { 
        debugPrint(themeViewModel.theme.toString());
            return Scaffold(
              appBar: AppBar(
                title: const Text("Usuário:"),
                actions: [

                  IconButton(
                    icon: const Icon(Icons.sunny),
                    onPressed: () {
                      themeViewModel.changeTheme();
                    },),

                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: () async {
                      var imagePath = await imagePicker.pickImage(source: ImageSource.gallery);
                      _postImage(imagePath!);
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                ],
              ),
          body: FutureBuilder(
            future: postRepository.get10PaginatedPosts(),
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return;
                  },
                );

              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Post(postModel: snapshot.data![index]);
                  },
                );
              } else {
                debugPrint(snapshot.error.toString());
                return Text("error");
              }
            },
          ),
        );
      },
    );
  }
}

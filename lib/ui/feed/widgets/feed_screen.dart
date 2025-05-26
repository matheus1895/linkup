import 'package:flutter/material.dart';
import 'package:linkup/ui/core/themes/theme.dart';
import 'package:linkup/ui/feed/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  static var appTheme = LinkupTheme.darkTheme;

  @override
  Widget build(BuildContext context) {

    var themeViewModel = Provider.of<ThemeViewModel>(context);

    return ListenableBuilder(
      listenable: themeViewModel,
      builder: (context, child) { 
        debugPrint(themeViewModel.theme.toString());
            return Scaffold(
              appBar: AppBar(
                title: const Text('LinkUp - Feed'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.sunny),
                    onPressed: () {
                      themeViewModel.changeTheme();
                    },),
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: () {
                      Navigator.pushNamed(context, '/upload');
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
              body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text('Usuário ${index + 1}'),
                        ),
                        Image.network(
                          'https://picsum.photos/500/300?random=$index',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Legenda da foto ${index + 1}'),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.comment),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
      },
    );
  }
}

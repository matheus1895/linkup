import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinkUp - Meu Perfil'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('https://picsum.photos/500/300?random=${index + 100}'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Minha foto ${index + 1}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

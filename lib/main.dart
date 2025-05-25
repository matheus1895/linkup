import 'package:flutter/material.dart';
import 'package:linkup/ui/home/widgets/login_screen.dart';
import 'package:linkup/ui/home/widgets/feed_screen.dart';
import 'package:linkup/ui/home/widgets/register_screen.dart';
import 'package:linkup/ui/home/widgets/profile_screen.dart';

void main() {
  runApp(const LinkUpApp());
}

class LinkUpApp extends StatelessWidget {
  const LinkUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkUp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: Colors.deepPurple,
          secondary: Colors.purpleAccent,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/feed': (context) => const FeedPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:linkup/firebase_options.dart';
import 'package:linkup/ui/core/view_models/auth_view_model.dart';
import 'package:linkup/ui/feed/view_models/theme_view_model.dart';
import 'package:linkup/ui/login/widgets/login_screen.dart';
import 'package:linkup/ui/feed/widgets/feed_screen.dart';
import 'package:linkup/ui/register/widgets/register_screen.dart';
import 'package:linkup/ui/profile/widgets/profile_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authViewModel = AuthViewModel();
  final isLoggedIn = await authViewModel.isUserLoggedIn();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => authViewModel),
      ],
      child: LinkUpApp(initialRoute: isLoggedIn ? '/feed' : '/login'),
    ),
  );
}

class LinkUpApp extends StatelessWidget {
  final String initialRoute;

  const LinkUpApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    var themeViewModel = Provider.of<ThemeViewModel>(context);
    return MaterialApp(
      title: 'LinkUp',
      debugShowCheckedModeBanner: false,
      theme: themeViewModel.theme,
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/feed': (context) => const FeedPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

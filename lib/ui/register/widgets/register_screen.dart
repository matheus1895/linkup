import 'package:flutter/material.dart';
import 'package:linkup/data/models/user_model.dart';
import 'package:linkup/ui/core/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final usernameController = TextEditingController();

    var authViewModel = Provider.of<AuthViewModel>(context);

    void _register() async {
      await authViewModel.registerUser(
        UserModel(
          email: emailController.text,
          username: usernameController.text,
          password: passwordController.text,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('LinkUp - Registro')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Criar uma conta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome de Usuário',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    try {
                      _register();
                      Navigator.pushReplacementNamed(context, '/feed');
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  child: const Text('Registrar'),
                ),

                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Já tem uma conta? Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

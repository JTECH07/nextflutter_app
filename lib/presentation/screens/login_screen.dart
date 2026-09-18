import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nextflutter_app/presentation/providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value != null && !value.contains('@') ? 'Email invalide' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) =>
                    value != null && value.length < 6 ? 'Min 6 caractères' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(),
                child: const Text('Se connecter'),
              ),
              if (!context.watch<AuthProvider>().isAuthenticated)
                TextButton(
                  onPressed: () {},
                  child: const Text('Pas de compte? Inscrivez-vous'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      try {
        context.read<AuthProvider>().login(_emailController.text, _passwordController.text);
      } catch (e) {
        // Show error to user
      }
    }
  }
}
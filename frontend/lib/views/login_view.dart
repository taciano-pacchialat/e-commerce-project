// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
                'Please log in to your account in order to interact with and create notes!'),
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              autofillHints: const [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'email',
              ),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(hintText: 'password'),
            ),
            TextButton(
              onPressed: () async {
                //TODO implement
              },
              child: const Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  //TODO implement
                },
                child: const Text('Forgot your password? Tap here!')),
            TextButton(
                onPressed: () {
                  //TODO implement
                },
                child: const Text('Not registered yet? Sign up here!'))
          ],
        ),
      ),
    );
  }
}

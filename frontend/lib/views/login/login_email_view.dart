// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class LoginEmailView extends StatefulWidget {
  const LoginEmailView({super.key});

  @override
  State<LoginEmailView> createState() => _LoginEmailViewState();
}

class _LoginEmailViewState extends State<LoginEmailView> {
  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
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
            const Text('Please enter your e-mail!'),
            TextField(
              controller: _email,
              enableSuggestions: true,
              autocorrect: false,
              autofillHints: const [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'email',
              ),
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
                child: const Text('Not registered yet? Sign up here!'))
          ],
        ),
      ),
    );
  }
}

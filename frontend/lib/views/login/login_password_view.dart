// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend/utilities/no_paste_text_formatter.dart';

class LoginPasswordView extends StatefulWidget {
  const LoginPasswordView({super.key});

  @override
  State<LoginPasswordView> createState() => _LoginPasswordViewState();
}

class _LoginPasswordViewState extends State<LoginPasswordView> {
  late final TextEditingController _password;

  @override
  void initState() {
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
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
            const Text('Now enter your password'),
            TextField(
              controller: _password,
              enableSuggestions: false,
              autocorrect: false,
              inputFormatters: [NoPasteTextFormatter()],
              autofillHints: const [AutofillHints.password],
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'password',
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
                child: const Text('Forgot password? Tap here!'))
          ],
        ),
      ),
    );
  }
}

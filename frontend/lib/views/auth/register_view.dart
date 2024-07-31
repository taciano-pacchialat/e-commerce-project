// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter your email and password to create an account!'),
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              autofocus: true,
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
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      //TODO implement
                    },
                    child: const Text("Register"),
                  ),
                  TextButton(
                      onPressed: () {
                        //TODO implement
                      },
                      child: const Text('Already registered? Log in here!'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

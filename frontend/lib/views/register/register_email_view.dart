// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class RegisterEmailView extends StatefulWidget {
  const RegisterEmailView({super.key});

  @override
  State<RegisterEmailView> createState() => _RegisterEmailViewState();
}

class _RegisterEmailViewState extends State<RegisterEmailView> {
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
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter your email to create an account!'),
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
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      //TODO implement
                    },
                    child: const Text("Next"),
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

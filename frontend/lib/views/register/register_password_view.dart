// ignore_for_file: use_build_context_synchronously

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:frontend/utilities/no_paste_text_formatter.dart';

class RegisterPasswordView extends StatefulWidget {
  const RegisterPasswordView({super.key});

  @override
  State<RegisterPasswordView> createState() => _RegisterPasswordViewState();
}

class _RegisterPasswordViewState extends State<RegisterPasswordView> {
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;
  String _passwordMatchMessage = '';
  final String _passwordsMatch = 'Passwords match';
  final String _passwordsDontMatch = 'Passwords do not match';

  void _checkPasswordMatch() {
    setState(() {
      if (_password.text == _confirmPassword.text) {
        _passwordMatchMessage = _passwordsMatch;
      } else {
        _passwordMatchMessage = _passwordsDontMatch;
      }
    });
  }

  @override
  void initState() {
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
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
            const Text('Now enter your password'),
            TextField(
              controller: _password,
              enableSuggestions: false,
              obscureText: true,
              autocorrect: false,
              autofocus: true,
              inputFormatters: [NoPasteTextFormatter()],
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
            const Text('Please confirm your password'),
            TextField(
              controller: _confirmPassword,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              inputFormatters: [NoPasteTextFormatter()],
              decoration: const InputDecoration(hintText: 'confirm password'),
              onChanged: (text) => _checkPasswordMatch(),
            ),
            Text(
              _passwordMatchMessage,
              style: TextStyle(
                color: _passwordMatchMessage == _passwordsMatch
                    ? Colors.green
                    : Colors.red,
              ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

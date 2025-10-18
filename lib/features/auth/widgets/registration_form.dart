import 'package:flutter/material.dart';
import 'package:testing/core/utils/validators.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const Key('emailField'),
                controller: _emailController,
                validator: Validators.validateEmail,
              ),
              TextFormField(
                key: const Key('passwordField'),
                controller: _passwordController,
                validator: Validators.validatePassword,
              ),
              TextFormField(
                key: const Key('confirmPasswordField'),
                controller: _confirmController,
                validator: (value) =>
                    Validators.validateConfirmPassword(_passwordController.text, value),
              ),
              ElevatedButton(
                key: const Key('submitButton'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is valid!')),
                    );
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
     ),
);
}
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/data/models/user_model.dart';
import 'package:shopp_app/providers/user_provider.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            const SizedBox(height: 10),
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 10),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 10),
            Consumer<UserProvider>(builder: (context, userProvider, child) {
              return ElevatedButton(
                onPressed: () async {
                  User user = User(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text);
                  await userProvider.userSignUp(context: context, user: user);
                },
                child: userProvider.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Register'),
              );
            })
          ],
        ),
      ),
    );
  }
}

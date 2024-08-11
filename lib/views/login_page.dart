import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/views/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  Map<String, dynamic> data = {
                    'email': emailController.text,
                    'password': passwordController.text
                  };
                  await userProvider.userSignIn(context: context, data: data);
                },
                child: userProvider.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Login'),
              );
            }),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUpPage()));
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/views/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CurrentUserModel? currentUserModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCurrentUser();
    });
    super.initState();
  }

  void getCurrentUser() async {
    currentUserModel = await context.read<UserProvider>().getCurrentUser();
    log('current user data :- ${currentUserModel!.toJson()}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("hello")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  foregroundColor: Colors.white,
                  backgroundColor: CupertinoColors.activeBlue),
              onPressed: () {
                Preferences.remove('token');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
              },
              child: const Text('log out'))
        ],
      ),
    );
  }
}

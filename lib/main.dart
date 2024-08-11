import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/views/home_page.dart';
import 'package:shopp_app/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;

  @override
  void initState() {
    getToken();
    super.initState();
  }

  void getToken() async {
    token = await Preferences.getString('token');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (token != null) ? const HomePage() : LoginPage(),
    );
  }
}

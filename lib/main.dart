import 'package:atunews/views/create_account.dart';
import 'package:atunews/views/home.dart';
import 'package:atunews/views/login.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AtuNewsHub());
}

class AtuNewsHub extends StatelessWidget {
  const AtuNewsHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ATU News Hub",
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/login/': (context) => const Login(),
        '/register/': (context) => const Register(),
      },
    );
  }
}

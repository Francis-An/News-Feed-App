import 'package:atunews/views/homeView.dart';
import 'package:atunews/views/login.dart';
import 'package:atunews/views/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const primary_color = Color(0xff1E4B7F);
    const secondary_color = Color(0xffD3AF35);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                // Show a loading indicator
                case ConnectionState.done:
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    if (user.emailVerified) {
                      print("Email is verified");
                      return const VerifiedEmailView();
                    } else {
                      return const HomeView();
                    }
                  } else {
                    return const Login();
                  }

                // return const Text("Done");
                // } else {
                //   return const VerifiedEmailView();

                // }
                // return const Text("Done");
                default:
                  return const Text('Loading...');
              }
            },
          ),
        ),
      ),
    );
  }
}

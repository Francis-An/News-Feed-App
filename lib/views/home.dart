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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder(
              future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              ),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  // Show a loading indicator
                  case ConnectionState.done:
                    final user = FirebaseAuth.instance.currentUser;
                    if (user?.emailVerified ?? false) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //Start of the AppBar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //Menu Button
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                icon: const Icon(
                                  Icons.menu,
                                  color: primary_color,
                                  size: 50,
                                ),
                                onPressed: () {},
                              ),
                              //Profile Image
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: primary_color,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: const Icon(Icons.person),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          const Text.rich(
                            TextSpan(
                              text: "News",
                              style: TextStyle(
                                  color: primary_color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              children: [
                                TextSpan(
                                    text: "Hub",
                                    style: TextStyle(
                                        color: secondary_color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                          //End of the AppBar
                        ],
                      );
                    } else {
                      return const Text("You're not verified!");
                    }
                  // return const Text("Done");
                  default:
                    return const Text('Loading...');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

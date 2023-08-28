import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools show log;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primary_color = Color(0xff1E4B7F);
    const secondary_color = Color(0xffD3AF35);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(
                    color: primary_color,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(100),
                ),
                //Text fields begins here

                //User email input text field
                TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your Email...",
                    labelText: "Email",
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: primary_color,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 3,
                          color: primary_color,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                //Password Text Field
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Enter your password...",
                    labelText: "Password",
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: primary_color,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 3,
                          color: primary_color,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(50)),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                      child: Text(
                        "Already have Account ",
                        style: TextStyle(
                          color: primary_color,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login/', (context) => false);
                        // return Login();
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: primary_color,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(20)),
                //Button
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondary_color,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      // final name = _name.text;
                      final email = _email.text;
                      final password = _password.text;

                      //Using try and catch to catch exceptions
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password);
                        devtools.log(userCredential.toString());
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "email-already-in-use") {
                          devtools.log("Email is already registered");
                        } else if (e.code == "weak-password") {
                          devtools.log("Your password is weak!");
                        } else if (e.code == "invalid-email") {
                          devtools.log("Email is not correct");
                        } else {
                          devtools.log(e.code);
                        }
                      }
                      //  catch (e) {
                      //   print(e);
                      // }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

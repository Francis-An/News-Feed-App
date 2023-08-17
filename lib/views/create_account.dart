import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';

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
            child: FutureBuilder(
              future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              ),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  // Show a loading indicator
                  case ConnectionState.done:
                    return Column(
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: Text.rich(
                            TextSpan(
                              text: "Already have Account! ",
                              style: TextStyle(
                                color: primary_color,
                                // fontSize: 20,
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign in",
                                  style: TextStyle(
                                    color: primary_color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                final userCredential = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password);
                                print(userCredential);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == "email-already-in-use") {
                                  print("Email is already registered");
                                } else if (e.code == "weak-password") {
                                  print("Your password is weak!");
                                } else if (e.code == "invalid-email") {
                                  print("Email is not correct");
                                } else {
                                  print(e.code);
                                }
                              }
                              //  catch (e) {
                              //   print(e);
                              // }
                            }),
                      ],
                    ); // Show a loading indicator
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

//Button widget for login page
// class Button extends StatelessWidget {
//   const Button({super.key, this.labelB});
//   final String? labelB;

//   @override
//   Widget build(BuildContext context) {
//     const secondary_color = Color(0xffD3AF35);
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: secondary_color,
//         minimumSize: const Size.fromHeight(50),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       child: const Text(
//         "Create Account",
//         style: TextStyle(fontSize: 20),
//       ),
//       onPressed: () async {
//       },
//     );
//   }
// }


//Input field widget for login page
// class InputField extends StatefulWidget {
//   const InputField({super.key, this.text, this.label,});
//   final String? text;
//   final String? label;
 

//   @override
//   State<InputField> createState() => _InputFieldState();
// }

// class _InputFieldState extends State<InputField> {
//   @override
//   Widget build(BuildContext context) {
//     const primary_color = Color(0xff1E4B7F);
//     return TextField(
//       // controller: widget.controller!,
//       decoration: InputDecoration(
//         hintText: widget.text,
//         labelText: widget.label,
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             width: 3,
//             color: primary_color,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               width: 3,
//               color: primary_color,
//             ),
//             borderRadius: BorderRadius.circular(15)),
//       ),
//     );
//   }
// }
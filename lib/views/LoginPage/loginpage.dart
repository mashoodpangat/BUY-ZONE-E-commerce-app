// ignore_for_file: non_constant_identifier_names

import 'package:e_commerce_app/views/LoginPage/RegistrationPage.dart';
import 'package:e_commerce_app/controller/firebasemodelclass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailcontroller = TextEditingController();

  final Passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    Passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 30),
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.cinzel(
                      fontSize: 36, fontWeight: FontWeight.bold),
                  // TextStyle(fontSize: 30, fontWeight: FontWeight.w800,)
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Email"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: 'Type your e-mail',
                        filled: true,
                        fillColor: const Color.fromARGB(255, 226, 226, 226),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 25),
                    child: Text('Password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                    child: TextField(
                      controller: Passwordcontroller,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: 'password',
                        filled: true,
                        fillColor: const Color.fromARGB(255, 226, 226, 226),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "forget password ?",
                      style: TextStyle(fontSize: 16),
                    ),
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 60,
              color: Colors.transparent,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailcontroller.text.trim(),
                      password: Passwordcontroller.text.trim());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have a account?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const RegistrationPAge())));
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
            const SizedBox(
              height: 110,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 60,
              color: Colors.transparent,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  firebasegoogleauth().signInWithGoogle();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 77),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 30,
                        child: const Image(
                            image: NetworkImage(
                                "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png")),
                      ),
                      const Text(
                        'Sign in with Google',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

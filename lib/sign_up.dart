import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storytelling/signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signupApiCall() async {
    try {
      var response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if (response.user?.uid.isNotEmpty == true) {
        await FirebaseFirestore.instance.collection('login').add({
          'uid': response.user?.uid,
          'email': response.user?.email,
          'firstName': firstName.text,
          'lastName': lastName.text,
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignIn(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.purple,
                    Colors.purple.shade300,
                    Colors.purple.shade200,
                  ],
                ),
              ),
              child: Column(
                children: [
                  BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "to start listening now!",
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 35),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          height: 55,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 50,
                              top: 3,
                            ),
                            child: TextField(
                              controller: firstName,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: "First Name",
                                icon: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.white38,
                                ),
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 50,
                              top: 3,
                            ),
                            child: TextField(
                              controller: lastName,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: "Last Name",
                                icon: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.white38,
                                ),
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 50,
                              top: 3,
                            ),
                            child: TextField(
                              controller: email,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: "Email",
                                icon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white38,
                                ),
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 50,
                              top: 3,
                            ),
                            child: TextField(
                              controller: password,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: "Password",
                                icon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.white38,
                                ),
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            signupApiCall();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_tellingapp/stories.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  get auth => null;

  signInApiCall() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControler.text, password: passwordControler.text);
    } catch (e) {
      print(" error >>>${e}");
      String error = e.toString();
      if (error.contains("Given String is empty or null")) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Field should not be blank")));
      }
      if (error.contains(
          "There is no user record corresponding to this identifier. The user may have been deleted.")) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Email id not registered")));
      }
      if (error.contains(
          "The password is invalid or the user does not have a password.")) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Incorrect Password")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
                        Colors.purple.shade200
                      ]),
                ),
                child: Column(
                  children: [
                    BackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 80),
                    Text("Welcome ,",
                        style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.normal,
                            color: Colors.white60)),
                    Text(
                      "Glad to see you Back!",
                      style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 35),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38),
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 50, top: 3),
                          child: TextField(
                            controller: emailControler,
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: "Email",
                                icon: Icon(Icons.email_outlined,
                                    color: Colors.white38),
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 35),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38),
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 50, top: 3),
                          child: TextField(
                            controller: passwordControler,
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: "Password",
                                icon: Icon(Icons.lock_outline_rounded,
                                    color: Colors.white38),
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        signInApiCall();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child: Text("LOGIN",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_tellingapp/stories.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController phoneControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  Dio dio = Dio();

  signInApiCall() async {
    try {
      var response = await dio.post('http://127.0.0.1:8080/auth/signIn', data: {
        "phoneNumber": phoneControler.text,
        "password": passwordControler.text
      });
      log(response.data['data']['session'].toString());
      if (response.data != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => story(),
            ));
      }
    } catch (e) {
      log(e.toString(), name: "error....");
      String error = e.toString();
      if (error
          .contains("the request contains bad syntax or cannot be fulfilled")) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User or password doesnot exist")));
      }
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
                  padding: const EdgeInsets.only(left: 35, right: 35, top: 35),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38),
                    height: 55,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 50, top: 3),
                      child: TextField(
                        controller: phoneControler,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "Phone Number",
                            icon: Icon(Icons.phone, color: Colors.white38),
                            enabledBorder: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35, top: 35),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38),
                    height: 55,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 50, top: 3),
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
                Container(
                  width: 330,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.topRight,
                          colors: [Colors.black26, Colors.black45]),
                      borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    onPressed: () {
                      signInApiCall();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.purple, // Set your preferred color
                    ),
                    child: Text("LOGIN",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

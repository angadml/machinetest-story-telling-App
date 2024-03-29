import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storytelling/signin.dart';

import 'author.dart';
import 'sign_up.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: [
        Container(

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
        ),
        Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              "Hey, There ",
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
            Text(
              " Welcome to story telling app",
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
            SizedBox(height: 100,),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Set your preferred color
                ),
                child: Text(
                  'sign in',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Set your preferred color
                ),
                child: Text(
                  'sign up',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('Author login'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => auth()));
                    },
                  ),
                  TextButton(
                    child: Text('admin login'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

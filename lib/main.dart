import 'package:flutter/material.dart';
import 'package:story_tellingapp/author.dart';
import 'package:story_tellingapp/signin.dart';
import 'package:story_tellingapp/stories.dart';
import 'package:story_tellingapp/viewstory.dart';


import 'createacc.dart';
import 'home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});






  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: home(),
    );
  }
}

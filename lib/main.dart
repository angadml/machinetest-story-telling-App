import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



import 'sign_up.dart';
import 'firebase_options.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
     );
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

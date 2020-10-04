import 'package:flutter/material.dart';
import 'package:relationship_ai/profileSetup.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Profile_2(),
    );
  }
}


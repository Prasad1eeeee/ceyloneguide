import 'package:ceyloneguide/home.dart';
import 'package:flutter/material.dart';
//import 'package:try1/home.dart'; // Importing home.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel App",
      home: HomePage(),
    );
  }
}

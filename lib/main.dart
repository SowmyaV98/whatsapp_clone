import 'package:flutter/material.dart';
import 'Screens/homescreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: const Color(0xFF075E54),
      ),
      home: const Homescreen(),
    );
  }
}

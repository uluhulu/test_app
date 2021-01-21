import 'package:flutter/material.dart';
import 'package:test_app/screens/mainscreen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: MainScreen(),
    );
  }
}


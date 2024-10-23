// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/search_screen.dart';
import 'pages/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

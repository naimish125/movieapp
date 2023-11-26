import 'package:flutter/material.dart';
import 'package:movieapp/screen/Home_Screen.dart';
import 'package:movieapp/screen/Splash_Screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SpleshScreen(),
        'Home': (context) => HomeScreen(),
      },
    ),
  );
}

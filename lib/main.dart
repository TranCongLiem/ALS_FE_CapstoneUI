import 'package:flutter/material.dart';
import 'Home/home_screen.dart';
import 'Login/login_screen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,

      home: LoginScreen(),
    );
  }
}
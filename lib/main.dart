import 'package:flutter/material.dart';
import 'package:medorant/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medorant',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 112, 111, 229),
        fontFamily: 'Lato',
      ),
      home: const LoginScreen(),
    );
  }
}

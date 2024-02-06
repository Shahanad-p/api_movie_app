import 'package:flutter/material.dart';
import 'package:movie_app/widget/bottom_navbar.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const BottomNavScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

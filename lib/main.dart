import 'package:flutter/material.dart';
import 'package:movie_app/controller/bottom_bar_provide.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/view/widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomBarProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvide()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const BottomNavScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

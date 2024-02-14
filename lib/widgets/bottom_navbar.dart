import 'package:flutter/material.dart';
import 'package:movie_app/controller/bottom_bar_provide.dart';
import 'package:movie_app/view/home_screen.dart';
import 'package:movie_app/view/search_screen.dart';
import 'package:movie_app/view/show_screen.dart';
import 'package:movie_app/view/tv_screen.dart';
import 'package:provider/provider.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  List get screens => [
        const HomeScreen(),
        const SearchScreen(),
        const TvScreen(),
        const ShowScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    final bottom = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      body: screens[bottom.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottom.currentIndex,
        onTap: (index) => bottom.bottomBuild(index),
        selectedItemColor: const Color.fromARGB(255, 23, 72, 111),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Show',
          ),
        ],
      ),
    );
  }
}

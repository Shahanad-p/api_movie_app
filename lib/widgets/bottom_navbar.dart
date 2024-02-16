// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:movie_app/controller/bottom_bar_provide.dart';
import 'package:movie_app/view/home_screen.dart';
import 'package:movie_app/view/search_screen.dart';
import 'package:movie_app/view/show_screen.dart';
import 'package:movie_app/view/tv_screen.dart';
import 'package:provider/provider.dart';

class BottomBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomBarProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: provider.currentIndex,
        children: const [
          HomeScreen(),
          SearchScreen(),
          TvScreen(),
          ShowScreen(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 0,
            elevation: 0,
            currentIndex: provider.currentIndex,
            onTap: (index) => provider.bottomBuild(index),
            backgroundColor: const Color.fromARGB(255, 3, 40, 12),
            selectedItemColor: const Color.fromARGB(255, 226, 219, 219),
            unselectedItemColor: const Color.fromARGB(255, 0, 9, 14),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home_sharp,
                ),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: Icon(
                  Icons.search,
                ),
              ),
              BottomNavigationBarItem(
                label: "TV",
                icon: Icon(
                  Icons.tab,
                ),
              ),
              BottomNavigationBarItem(
                label: "Show",
                icon: Icon(
                  Icons.movie,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

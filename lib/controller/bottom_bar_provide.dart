import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  void bottomBuild(index) {
    currentIndex = index;
    notifyListeners();
  }
}

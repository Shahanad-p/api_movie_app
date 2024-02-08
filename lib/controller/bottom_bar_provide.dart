import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  void BottomBuild(index) {
    currentIndex = index;
    notifyListeners();
  }
}

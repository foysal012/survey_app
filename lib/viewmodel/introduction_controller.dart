import 'package:flutter/material.dart';

class IntroductionController with ChangeNotifier{

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }


}
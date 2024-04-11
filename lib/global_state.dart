import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier {
  bool isDarkMode;
  Color primaryColor;

  GlobalState({required this.isDarkMode, required this.primaryColor});

  void changePrimaryColor(Color newColor) {
    primaryColor = newColor;
    notifyListeners();
  }
}
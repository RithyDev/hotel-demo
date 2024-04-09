import 'package:flutter/material.dart';

class RouteName {
  static String get splashScreen => '/splash_screen';
  static String get homePage => '/home_page';
}

final Map<String, WidgetBuilder> appRounte = {
  RouteName.splashScreen: (context) => const Scaffold(),
  RouteName.homePage: (context) => const Scaffold(),
};
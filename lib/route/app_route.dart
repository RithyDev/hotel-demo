import 'package:flutter/material.dart';
import 'package:hotel_app/feature/home/home_page.dart';
import 'package:hotel_app/feature/onboard/onboard_page.dart';

class RouteName {
  static String get splashScreen => '/splash_screen';
  static String get onboardPage => '/onboard_page';
  static String get homePage => '/home_page';
}

final Map<String, WidgetBuilder> appRounte = {
  RouteName.splashScreen: (context) => const Scaffold(),
  RouteName.onboardPage: (context) => const OnboardPage(),
  RouteName.homePage: (context) => const HomePage(),
};
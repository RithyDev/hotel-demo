import 'package:flutter/material.dart';
import 'package:hotel_app/feature/auth/login/login_page.dart';
import 'package:hotel_app/feature/auth/login/signup/sign_up_page.dart';
import 'package:hotel_app/feature/home/home_page.dart';
import 'package:hotel_app/feature/onboard/onboard_page.dart';

class RouteName {
  static String get splashScreen => '/splash_screen';
  static String get onboardPage => '/onboard_page';
  static String get loginPage => '/login_page';
  static String get signUpPage => '/sign_up_poge';
  static String get homePage => '/home_page';
}

final Map<String, WidgetBuilder> appRounte = {
  RouteName.splashScreen: (context) => const Scaffold(),
  RouteName.onboardPage: (context) => const OnboardPage(),
  RouteName.homePage: (context) => const HomePage(),
  RouteName.loginPage: (context) => const LoginPage(),
  RouteName.signUpPage:(context) => const SignUpPage()
};
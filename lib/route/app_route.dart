import 'package:flutter/material.dart';
import 'package:hotel_app/feature/auth/login/login_page.dart';
import 'package:hotel_app/feature/auth/signup/otp/sign_up_confitm_otp.dart';
import 'package:hotel_app/feature/auth/signup/sign_up_page.dart';
import 'package:hotel_app/feature/home/home_page.dart';
import 'package:hotel_app/feature/onboard/onboard_page.dart';
import 'package:hotel_app/splash_screen.dart';

class RouteName {
  static const splashScreen = '/splash_screen';
  static const signUpPage = '/sign_up_poge';
  static const signUpOtpPage = '/sign_up_otp';
  static const onboardPage = '/onboard_page';
  static const loginPage = '/login_page';
  static const homePage = '/home_page';
}

final Map<String, WidgetBuilder> appRounte = {
  RouteName.splashScreen: (context) => const SplashScreenPage(),
  RouteName.onboardPage: (context) => const OnboardPage(),
  RouteName.homePage: (context) => const HomePage(),
  RouteName.loginPage: (context) => const LoginPage(),
  RouteName.signUpPage: (context) => SignUpPage(),
  RouteName.signUpOtpPage:(context) => const SignUpConfirmOtpPage()
};

Widget getPageByNamed(String rounteName) {
  return switch (rounteName) {
    RouteName.onboardPage => const OnboardPage(),
    _ => const Placeholder()
  };
}

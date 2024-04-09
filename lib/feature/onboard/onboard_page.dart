import 'package:flutter/material.dart';
import 'package:hotel_app/route/app_route.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton(onPressed: () => handleOnClick(), child: const Text('Go home')),
      ),
    );
  }
  
  void handleOnClick() {
    Navigator.pushNamed(context, RouteName.homePage);
  }
}
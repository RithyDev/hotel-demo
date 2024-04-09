import 'package:flutter/material.dart';
import 'package:hotel_app/route/app_route.dart';

class HotelApp extends StatelessWidget {
  final String? intialPage;
  const HotelApp({super.key, this.intialPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: intialPage ?? RouteName.splashScreen,
      routes: appRounte,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hotel_app/app_state.dart';
import 'package:hotel_app/global_state.dart';
import 'package:hotel_app/route/app_route.dart';
import 'package:provider/provider.dart';

class HotelApp extends StatelessWidget {
  final String? intialPage;
  const HotelApp({super.key, this.intialPage});

  @override
  Widget build(BuildContext context) {
  
    return MultiProvider(
        providers: appChnageNotifierProviders(),
        child: Consumer<GlobalState>(
            builder: (context, state, child) => _renderApp(state)));
  }

  Widget _renderApp(GlobalState state) {
    final primaryColor = state.primaryColor;
    return MaterialApp(
      title: 'Hotel demo',
      theme: ThemeData(
        fontFamily: 'MyOpenSan',
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        primaryColor: primaryColor,
        primaryColorLight: primaryColor.withOpacity(0.2),
        primaryColorDark: const Color.fromARGB(255, 26, 118, 194),
        useMaterial3: true,
      ),
      initialRoute: intialPage ?? RouteName.splashScreen,
      routes: appRounte,
    );
  }
}

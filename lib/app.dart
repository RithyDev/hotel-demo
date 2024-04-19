import 'package:flutter/material.dart';
import 'package:hotel_app/app_state.dart';
import 'package:hotel_app/feature/booking/hotel_booking_viewmodel.dart';
import 'package:hotel_app/global_state.dart';
import 'package:hotel_app/route/app_route.dart';
import 'package:provider/provider.dart';

class HotelApp extends StatefulWidget {
  final String? intialPage;
  final Function(BuildContext context) onPageReady;

  const HotelApp({super.key, this.intialPage, required this.onPageReady});

  @override
  State<HotelApp> createState() => _HotelAppState();
}

class _HotelAppState extends State<HotelApp> {

  @override
  void initState() {
    super.initState();
    widget.onPageReady(context);
  }

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
      initialRoute: widget.intialPage ?? RouteName.splashScreen,
      routes: appRounte,
    );
  }
}
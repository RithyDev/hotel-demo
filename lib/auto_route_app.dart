import 'package:flutter/material.dart';
import 'package:hotel_app/app_state.dart';
import 'package:hotel_app/global_state.dart';
import 'package:hotel_app/route/auto_route.dart';
import 'package:provider/provider.dart';

class AutoRouteApp extends StatefulWidget {
  const AutoRouteApp({super.key});

  @override
  State<AutoRouteApp> createState() => _AutoRouteAppState();
}

class _AutoRouteAppState extends State<AutoRouteApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: appChnageNotifierProviders(),
        child: Consumer<GlobalState>(
            builder: (context, state, child) => _renderApp(state)));
  }

  MaterialApp _renderApp(GlobalState state) {
    Color primaryColor = Colors.blue;
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'MyOpenSan',
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        primaryColor: primaryColor,
        primaryColorLight: primaryColor.withOpacity(0.2),
        primaryColorDark: const Color.fromARGB(255, 26, 118, 194),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}

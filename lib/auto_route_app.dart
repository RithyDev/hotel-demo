import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hotel_app/app_state.dart';
import 'package:hotel_app/global_state.dart';
import 'package:hotel_app/route/auto_route.dart';
import 'package:hotel_app/widget/mobile_sticky_layout.dart';
import 'package:provider/provider.dart';

class AutoRouteApp extends StatefulWidget {
  
  const AutoRouteApp({super.key, required this.onPageReady});
  final Function(BuildContext context) onPageReady;

  @override
  State<AutoRouteApp> createState() => _AutoRouteAppState();
}

class _AutoRouteAppState extends State<AutoRouteApp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    widget.onPageReady(context);
    if (kIsWeb) {
      return;
    }
    if (Platform.isAndroid) {
      FlutterDisplayMode.setHighRefreshRate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: appChnageNotifierProviders(),
        child: Consumer<GlobalState>(
            builder: (context, state, child) => _renderApp(state)));
  }

  Widget _renderApp(GlobalState state) {
    Color primaryColor = Colors.blue;
    return MobileFormLayout(
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: 'MyOpenSan',
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          primaryColor: primaryColor,
          primaryColorLight: primaryColor.withOpacity(0.2),
          primaryColorDark: const Color.fromARGB(255, 26, 118, 194),
          useMaterial3: true,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}

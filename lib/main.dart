import 'package:flutter/material.dart';
import 'package:hotel_app/auto_route_app.dart';
import 'package:hotel_app/database/database_main.dart';
import 'package:hotel_app/di/di.dart';
import 'package:hotel_app/display_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runLocalDatabase();
  setupDependeciesInjection();
  await runWrapper();
}

Future<void> runWrapper() async {
  await applySystemDisplay();
  runApp(const AutoRouteApp());
  // runApp(HotelApp(
  //   intialPage: RouteName.splashScreen,
  //   onPageReady: (context) => setupDIOnAppReady(context),
  // ));
}

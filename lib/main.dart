import 'package:flutter/material.dart';
import 'package:hotel_app/app.dart';
import 'package:hotel_app/di/di.dart';
import 'package:hotel_app/display_utils.dart';
import 'package:hotel_app/route/app_route.dart';

void main() async {
  setupDependeciesInjection();
  await runWrapper();
}

Future<void> runWrapper() async {
  await applySystemDisplay();
  runApp(HotelApp(intialPage: RouteName.splashScreen));
}
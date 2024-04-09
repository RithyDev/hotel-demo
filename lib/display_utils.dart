import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> applySystemDisplay() async {

  WidgetsFlutterBinding.ensureInitialized();
  applyOnDisplayModeChange(true);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []); 
}

void applyOnDisplayModeChange(bool isLightMode) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      //Android status bar
      statusBarIconBrightness: isLightMode ? Brightness.dark : Brightness.light,
      systemNavigationBarContrastEnforced: false,
      //iOS status bar
      statusBarBrightness: isLightMode ? Brightness.light : Brightness.dark));
}

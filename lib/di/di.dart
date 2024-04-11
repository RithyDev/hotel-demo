import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/global_state.dart';
import 'package:hotel_app/remote/service/di.dart';
import 'package:hotel_app/repository/di.dart';

GetIt getIt = GetIt.instance;

void setupDependeciesInjection() {
  appModule();
  serviceModule();
  repoModule();
}

void appModule() {
  getIt.registerSingleton(
      GlobalState(isDarkMode: false, primaryColor: Colors.blue));
}

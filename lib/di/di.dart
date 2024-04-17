import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/core/assets_json_reader.dart';
import 'package:hotel_app/global_state.dart';
import 'package:hotel_app/remote/service/di.dart';
import 'package:hotel_app/repository/di.dart';
import 'package:hotel_app/repository/home_repository.dart';

GetIt getIt = GetIt.instance;

void setupDependeciesInjection() {
  appModule();
  serviceModule();
  repoModule();
}

void setupDIOnAppReady(BuildContext globalContext) {
  var jsonReader = JsonAssetReader(globalContext);
  var homeRepo = HomeRepository(jsonReader: jsonReader);
  getIt.registerSingleton(jsonReader);
  getIt.registerFactory(() => homeRepo);
  
}

void appModule() {
  getIt.registerSingleton(
      GlobalState(isDarkMode: false, primaryColor: Colors.blue));
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hotel_app/database/model/user_dao.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> databaseModule() async {
  await _initDatabase();
  final userDao = UserDao.createNewInstance();
  GetIt.I.registerSingleton(userDao);
  var users = await userDao.where((_) => true);
  
  //for development purpose only
  const tag = "--myuser--";
  debugPrint('$tag All user');
  for (var user in users) {
    debugPrint('$tag username: ${user.username} email: ${user.email} pwd: ${user.password}');
  }
}

Future<void> _initDatabase() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
}

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hotel_app/database/model/user_dao.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> databaseModule() async {
  await _initDatabase();
  final userDao = UserDao.createNewInstance();
  GetIt.I.registerSingleton(userDao);
}

Future<void> _initDatabase() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
}

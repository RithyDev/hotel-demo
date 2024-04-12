import 'package:get_it/get_it.dart';
import 'package:hotel_app/database/model/user_dao.dart';
import 'package:hotel_app/remote/service/json_user_service_imp.dart';
import 'package:hotel_app/remote/service/user_service.dart';

void serviceModule() {
  GetIt.I.registerSingleton<UserService>(
      JsonUserServiceImpl(UserDao.createNewInstance()));
}

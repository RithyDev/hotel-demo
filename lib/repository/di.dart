import 'package:get_it/get_it.dart';
import 'package:hotel_app/remote/service/user_service.dart';
import 'package:hotel_app/repository/user_repo.dart';

void repoModule() {
  final UserService userService = GetIt.I<UserService>();
  GetIt.I.registerLazySingleton(() => UserRepository(userService: userService));
}
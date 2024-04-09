import 'package:hotel_app/remote/service/user_service.dart';

class UserRepository {

  final UserService userService;
  UserRepository({required this.userService});

  Future<String?> getToken() async {
    try {
      return await userService.login('username', 'password');
    } on Exception catch (e) {
      return null;
    }
  }
}
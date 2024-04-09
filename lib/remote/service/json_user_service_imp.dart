import 'package:hotel_app/remote/service/user_service.dart';

class JsonUserServiceImpl implements UserService {

  @override
  Future<void> createUser(String username, String email, String password) async {
    return;
  }

  @override
  Future<String> login(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return "implement your token";
  }
}
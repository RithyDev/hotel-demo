import 'package:hotel_app/remote/model/sign_init_info.dart';

//Currenty we have only for local service implement 
//Check out json_user_service_impl.dart
abstract class UserService {

  Future<SignUpInitInfo> initCreateUser(String username, String emailOrPhone, String password);

  Future<String> submitCreateUser(String ref, String otp);
  
  Future<void> createUser(String username, String email, String password);
  
  Future<String> login(String username, String password);

}
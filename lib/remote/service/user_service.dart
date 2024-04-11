abstract class UserService {

  Future<String> initCreateUser(String username, String emailOrPhone, String password);

  Future<String> submitCreateUser(String ref, String otp);
  
  Future<void> createUser(String username, String email, String password);
  
  Future<String> login(String username, String password);

}
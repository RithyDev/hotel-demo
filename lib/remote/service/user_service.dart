abstract class UserService {
  
  Future<void> createUser(String username, String email, String password);
  
  Future<String> login(String username, String password);

}
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/feature/auth/login/login_form_data.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/model/input_form_data.dart';
import 'package:hotel_app/repository/user_repo.dart';

class LoginViewModel extends ChangeNotifier {

  final UserRepository userRepo;

  final LoginFormData formData = LoginFormData();

  InputFormData<String> get email => formData.emailOrPhone;
  InputFormData<String> get password => formData.password;

  Function()? _handleOnUserAuthenticated;
  AsyncData<String>? _authState;
  AsyncData<String>? get authState => _authState;

  LoginViewModel._(this.userRepo);

  void doOnUserAuthenticated(Function() listener) {
    _handleOnUserAuthenticated = listener;
  }

  void handleOnEmailChange(String value) {
    email.value = value;
    formData.compileUsername();
    notifyListeners();
  }

  void handleOnPasswordChange(String value) {
    password.value = value;
    formData.compilePassword();
    notifyListeners();
  }

  void login() async {
    if (!formData.isValid()) {
      return;
    }
    try {
      invokeAuthStateChange(Loading());
    
      final String emailOrPhone = email.value?? '';
      final String pwd = password.value??'';

      final token = await userRepo.login(emailOrPhone, pwd);
      invokeAuthStateChange(Success(token ?? ''));
      if (_handleOnUserAuthenticated != null) {
        _handleOnUserAuthenticated!();
      }
    } on Exception catch (e) {
      invokeAuthStateChange(Fail(e));
    }
  }

  void invokeAuthStateChange(AsyncData<String> newState) {
    _authState = newState;
    notifyListeners();
  }
  
  void resetAuthState() {
    _authState = null;
  }

  void compileFormError() {
    final emialValue = email.value ?? '';
    final pwd = password.value ?? '';
    if (emialValue.isEmpty) {
      email.errorMessage = "Email can not be empty";
    }
    if (pwd.isEmpty) {
      password.errorMessage = "Password cannot be empty";
    }
    notifyListeners();
  }

  bool validateFormData() {
    final emialValue = email.value ?? '';
    final pwd = password.value ?? '';
    return emialValue.isNotEmpty && pwd.isNotEmpty;
  }

  factory LoginViewModel.createNewInstance() {
    final userRpo = GetIt.I<UserRepository>();
    return LoginViewModel._(userRpo);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/model/input_form_data.dart';
import 'package:hotel_app/repository/user_repo.dart';

class LoginViewModel extends ChangeNotifier {

  final UserRepository userRepo;
  final InputFormData<String> email = InputFormData(null);
  final InputFormData<String> password = InputFormData(null);

  Function()? _handleOnUserAuthenticated;

  AsyncData<String>? authState;

  LoginViewModel._(this.userRepo);

  void doOnUserAuthenticated(Function() listener) {
    _handleOnUserAuthenticated = listener;
  }

  void handleOnEmailChange(String value) {
    email.value = value;
    if (email.errorMessage != null) {
      email.errorMessage = null;
      notifyListeners();
    }
  }

  void handleOnPasswordChange(String value) {
    password.value = value;
    if (password.errorMessage != null) {
      password.errorMessage = null;
      notifyListeners();
    }
  }

  void login() async {
    if (!validateFormData()) {
      compileFormError();
      return;
    }
    try {
      invokeAuthStateChange(Loading());
      authState = Loading();
      final token = await userRepo.getToken();
      invokeAuthStateChange(Success(token ?? ''));
      if (_handleOnUserAuthenticated != null) {
        _handleOnUserAuthenticated!();
      }
    } on Exception catch (e) {
      invokeAuthStateChange(Fail(e));
    }
  }

  void invokeAuthStateChange(AsyncData<String> newState) {
    authState = newState;
    notifyListeners();
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

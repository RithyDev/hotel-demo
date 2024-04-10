import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/feature/auth/login/signup/signup_form_data.dart';
import 'package:hotel_app/repository/user_repo.dart';

class SignUpViewModel extends ChangeNotifier {
  final UserRepository userRepo;
  final formData = SignUpFormData();

  SignUpViewModel._(this.userRepo);

  void setUsername(String value) { 
    formData.username.value = value;
    formData.compileUsername();
    notifyListeners();
  }

  void setEmailOrPhone(String value) {
    formData.emailOrPhone.value = value;
    formData.compileEmailOrPhone();
    notifyListeners();
  }

  void setPassword(String value) {
    formData.password.value = value;
    formData.compilePassword();
    notifyListeners();
  }

  bool isValidInputForm() {
    return formData.isValid();
  }

  void signUp() {}

  factory SignUpViewModel.createNewInstance() {
    final userRepo = GetIt.I<UserRepository>();
    return SignUpViewModel._(userRepo);
  }
}

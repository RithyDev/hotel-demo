import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/feature/auth/signup/signup_form_data.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/repository/user_repo.dart';

class SignUpViewModel extends ChangeNotifier {
  
  final UserRepository userRepo;
  final formData = SignUpFormData();
  
  AsyncData<String>? _init;
  AsyncData<String>? get init => _init;

  void setInitState(AsyncData<String>? state) {
    _init = state;
    notifyListeners();
  }

  SignUpViewModel._(this.userRepo);

  void reset() => formData.reset();

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

  void signUp() async {
    try {
      var username = formData.username.value??'';
      var emailOrPhone = formData.emailOrPhone.value??'';
      var password = formData.password.value??'';
      setInitState(Loading());
      String ref = await userRepo.initRegisterUser(username, emailOrPhone, password);
      setInitState(Success(ref));
    } on Exception catch(e) {
      setInitState(Fail(e));
    }
  }

  factory SignUpViewModel.createNewInstance() {
    final userRepo = GetIt.I<UserRepository>();
    return SignUpViewModel._(userRepo);
  }
}

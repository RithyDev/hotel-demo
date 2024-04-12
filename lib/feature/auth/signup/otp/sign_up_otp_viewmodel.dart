import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/repository/user_repo.dart';

class SignUpConfirmOtpViewModel extends ChangeNotifier {

  String _code = "";
  String get code => _code;
  String? ref;
  String? otp;
  String? emailOrPhone;

  AsyncData<String>? _otpState;
  AsyncData<String>? get otpState => _otpState;
  
  final UserRepository userRepo;
  SignUpConfirmOtpViewModel._(this.userRepo);  

  void resolvedArg(Map<String, dynamic>? args) {
    if (args != null) {
      ref = args['ref'];
      otp = args['otp'];
      emailOrPhone = args['emailOrPhone'];
    }
  }

  void setOtpCode(String code){
    _code = code;
    submit();
  }

  void submit() async {
    try {
      setOtpState(Loading());
      String token = await userRepo.createUser(ref??'', code);
      setOtpState(Success(token));
    } on Exception catch(e) {
      setOtpState(Fail(e));
    }
  }

  void setOtpState(AsyncData<String>? state) {
    _otpState = state;
    notifyListeners();
  }

  factory SignUpConfirmOtpViewModel.createNewInstance() {
    return SignUpConfirmOtpViewModel._(GetIt.I());
  }
}
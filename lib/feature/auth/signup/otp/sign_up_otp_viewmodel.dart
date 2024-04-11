import 'package:flutter/material.dart';
import 'package:hotel_app/model/async_data.dart';

class SignUpConfirmOtpViewModel extends ChangeNotifier {

  String _code = "";

  AsyncData<String>? _otpState;
  AsyncData<String>? get otpState => _otpState;

  String get code => _code;

  SignUpConfirmOtpViewModel._();  

  void setOtpCode(String code){
    _code = code;
    submit();
  }

  void submit() async {
    setOtpState(Loading());
    await Future.delayed(const Duration(seconds: 2));
    setOtpState(Success('Success'));
  }

  void setOtpState(AsyncData<String>? state) {
    _otpState = state;
    notifyListeners();
  }

  factory SignUpConfirmOtpViewModel.createNewInstance() {
    return SignUpConfirmOtpViewModel._();
  }
}
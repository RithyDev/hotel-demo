import 'package:hotel_app/model/input_form_data.dart';

bool validateUsername(InputFormData<String> username) {
    final value = username.value;
    if (value == null) {
      return false;
    }
    final RegExp regex = RegExp(r'^[a-zA-Z0-9_]{6,16}$');
    bool isValid = regex.hasMatch(value);
    username.errorMessage = isValid ? null : 'Invalid username format';
    return isValid;
  }

bool validateEmail(InputFormData<String> email) {
  final value = email.value;
  if (value == null) {
    return false;
  }
  final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final isValid = regex.hasMatch(value);
  email.errorMessage = isValid ? null : 'Incorrect email format';
  return isValid;
}

bool validatePhoneNumber(InputFormData<String> phone) {
  final value = phone.value;
  if (value == null) {
    return false;
  }
  final RegExp regex = RegExp(r'^\d{9}(?:\d)?$');
  final isValid = regex.hasMatch(value);
  phone.errorMessage = isValid ? null : 'Incorrect phone number';
  return isValid;
}

bool validatePassword(InputFormData<String> password) { 
  final value = password.value;
  if (value == null) {
    return false;
  }
  final RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
  final isValid = regex.hasMatch(value);
  password.errorMessage = isValid ? null : 'Incorrect password format';
  return isValid;
}
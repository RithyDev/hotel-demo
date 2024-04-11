import 'package:hotel_app/model/input_form_data.dart';

class SignUpFormData {
  InputFormData<String> username = InputFormData(null);
  InputFormData<String> emailOrPhone = InputFormData(null);
  InputFormData<String> password = InputFormData(null);

  bool isValid() {
    return compileUsername() && compileEmailOrPhone() && compilePassword();
  }

  void compileForFormError() {
    compileUsername();
  }

  bool compileUsername() {
    final value = username.value;
    if (value == null) {
      return false;
    }
    final RegExp regex = RegExp(r'^[a-zA-Z0-9_]{6,16}$');
    bool isValid = regex.hasMatch(value);
    username.errorMessage = isValid ? null : 'Invalid username';
    return isValid;
  }

  bool compileEmailOrPhone() {
    final value = emailOrPhone.value;
    if (value == null) {
      return false;
    }
    final RegExp regex = RegExp(r'^\d{9}(?:\d)?$');
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    bool isValid = regex.hasMatch(value) || emailRegex.hasMatch(value);
    emailOrPhone.errorMessage =
        isValid ? null : 'Invalid email or phone number';
    return isValid;
  }

  bool compilePassword() {
    final value = password.value;
    if (value == null) {
      return false;
    }

    final RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
    final isValid = regex.hasMatch(value);
    password.errorMessage = isValid ? null : 'Password is correct format';
    return isValid;
  }
}

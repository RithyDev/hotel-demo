import 'package:hotel_app/model/input_form_data.dart';
import 'package:hotel_app/utils/form_validator.dart';

class SignUpFormData {
  
  InputFormData<String> username = InputFormData(null);
  InputFormData<String> emailOrPhone = InputFormData(null);
  InputFormData<String> password = InputFormData(null);

  void reset() {
    username.clear();
    emailOrPhone.clear();
    password.clear();  
  }

  bool isValid() {
    return compileUsername() && compileEmailOrPhone() && compilePassword();
  }

  void compileForFormError() {
    compileUsername();
  }

  bool compileUsername() => validateUsername(username);

  bool compileEmailOrPhone() {
    final value = emailOrPhone.value ?? '';
    final RegExp regex = RegExp(r'^[0-9]+$');
    final isNumber = regex.hasMatch(value);
    return isNumber ? validatePhoneNumber(emailOrPhone) : validateEmail(emailOrPhone);
  }
      

  bool compilePassword() => validatePassword(password);
}

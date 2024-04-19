import 'package:hotel_app/model/input_form_data.dart';
import 'package:hotel_app/utils/form_validator.dart';

class LoginFormData {

  final InputFormData<String> emailOrPhone = InputFormData(null);
  final InputFormData<String> password = InputFormData(null);

  bool isValid() {
    return compileUsername() && compilePassword();
  }  

  bool compileUsername() {
     final value = emailOrPhone.value ?? '';
    final RegExp regex = RegExp(r'^[0-9]+$');
    final isNumber = regex.hasMatch(value);
    return isNumber ? validateFormPhoneNumber(emailOrPhone) : validateEmail(emailOrPhone);
  }

  bool compilePassword() => validatePassword(password);
}
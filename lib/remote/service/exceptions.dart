abstract class IOExcepection implements Exception {
  String get errorMessage;
}

class UserAlreadyExistException implements IOExcepection {
  final String username;
  UserAlreadyExistException(this.username);

  @override
  String get errorMessage =>
      'Sorry, this username "$username" is already existed. Please choose another one.';
}

class ExistedEmailOrPhoneNumberException implements IOExcepection {
  final String source;
  ExistedEmailOrPhoneNumberException(this.source);

  @override
  String get errorMessage =>
      'Sorry, this email or phone number of "$source" is alrady existed';
}

class InvalidOtpException implements IOExcepection {
  @override
  String get errorMessage => "Sorry, you're input the incorrect OTP";
}

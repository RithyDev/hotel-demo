import 'package:flutter/material.dart';
import 'package:hotel_app/model/input_form_data.dart';
import 'package:hotel_app/utils/form_validator.dart';

class HotelBookingFormData {

  InputFormData<DateTimeRange> dates = InputFormData(null);
  InputFormData<String> phoneNumber = InputFormData(null);

  bool isValid() {
    return compileErrorForPhoneNumber();
  }

  bool compileErrorForPhoneNumber() => validateFormPhoneNumber(phoneNumber);
} 
import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/hotel_booking_form_data.dart';
import 'package:hotel_app/model/input_form_data.dart';

class HotelBookingViewModel extends ChangeNotifier {

  final HotelBookingFormData _formData = HotelBookingFormData();

  InputFormData<String> get phoneNumber => _formData.phoneNumber;

  void setPhoneNumber(String value) {
    phoneNumber.value =value;
    _formData.compileErrorForPhoneNumber();
    notifyListeners();
  }
   
}
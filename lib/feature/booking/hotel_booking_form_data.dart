import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/model/room_info.dart';
import 'package:hotel_app/feature/booking/model/room_model.dart';
import 'package:hotel_app/model/input_form_data.dart';
import 'package:hotel_app/utils/form_validator.dart';

class HotelBookingFormData {
  InputFormData<DateTimeRange> bookingDateRange = InputFormData(null);
  InputFormData<String> phoneNumber = InputFormData(null);
  InputFormData<BookingRoomInfo> guestInfo = InputFormData(null);
  InputFormData<RoomModel> roomType = InputFormData(null);

  bool isValid() {
    return compileErrorForPhoneNumber();
  }

  bool compileErrorForPhoneNumber() =>
      validateFormPhoneNumber(phoneNumber) &&
      bookingDateRange.value != null &&
      guestInfo.value != null &&
      roomType.value != null;
}

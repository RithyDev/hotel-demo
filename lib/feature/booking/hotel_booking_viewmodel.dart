import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/hotel_booking_form_data.dart';
import 'package:hotel_app/feature/booking/model/room_info.dart';
import 'package:hotel_app/feature/booking/model/room_model.dart';
import 'package:hotel_app/model/input_form_data.dart';

class HotelBookingViewModel extends ChangeNotifier {

  final HotelBookingFormData _formData = HotelBookingFormData();

  InputFormData<String> get phoneNumber => _formData.phoneNumber;
  InputFormData<DateTimeRange> get dateRange => _formData.bookingDateRange;
  InputFormData<BookingRoomInfo> get guestInfo => _formData.guestInfo;
  InputFormData<RoomModel> get roomType => _formData.roomType;

  void setPhoneNumber(String value) {
    phoneNumber.value =value;
    _formData.compileErrorForPhoneNumber();
    notifyListeners();
  }

  void setBookingDates(DateTimeRange range) {
    dateRange.value = range;
    notifyListeners();
  }

  void setGuestsInfo(BookingRoomInfo info) {
    guestInfo.value = info;
    notifyListeners();
  }

  void setRoomType(RoomModel value) {
    roomType.value = value;
    notifyListeners();
  }

  List<RoomModel> roomTypes = [
    RoomModel(roomId: '00001', title: 'Queen Room', subtitle: 'A room with a queen-size. May be acc..'),
    RoomModel(roomId: '00002', title: 'King Room', subtitle: 'A room with a king-size. May be acc..')
  ];

  bool get shouldEnabledButton => _formData.isValid();
   
}
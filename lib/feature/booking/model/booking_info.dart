import 'package:flutter/material.dart';

class BookingInfo {
  final DateTimeRange date;
  final String guestInfo;
  final String roomType;
  final String phone;
  final Map<String, String> priceDetails;

  BookingInfo(
      {required this.date,
      required this.guestInfo,
      required this.roomType,
      required this.phone,
      required this.priceDetails});
}

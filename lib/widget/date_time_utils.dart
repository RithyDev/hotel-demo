import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeRangeUtils on DateTimeRange {
  String formatToString() {
    if (start == end) {
      return start.shortenFormat();
    }
    return "${start.shortenFormat()} to ${end.shortenFormat()}";
  }
}

extension DateTimeUtils on DateTime {

  String shortenFormat() {
    var formater = DateFormat('dd/MM/yyyy');
    return formater.format(this);
  }

  String dayMonthFormat() {
    var formater = DateFormat('dd MMMM');
    return formater.format(this);
  }
  
}

class DateTimeUtil {

  static DateTime? fromDateString(String value) {
    DateFormat format = DateFormat("dd/MM/yyyy");
    return format.parse(value);
  }
}

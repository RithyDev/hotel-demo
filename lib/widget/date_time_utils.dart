import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeRangeUtils on DateTimeRange {
  String formatToString() {
    return "${start.shortenFormat()} to ${end.shortenFormat()}";
  }
}

extension DateTimeUtils on DateTime {
  String shortenFormat() {
    var formater = DateFormat('dd/MM/yyyy');
    return formater.format(this);
  }
}

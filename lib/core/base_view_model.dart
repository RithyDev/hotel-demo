import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {

  String getErrorMessage(Exception err) {
    return '';
  }
}


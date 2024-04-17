import 'package:flutter/material.dart';

abstract class TabPageBehavior {
  
  void onReady();
  Widget get page;
}

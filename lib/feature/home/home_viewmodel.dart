import 'package:flutter/material.dart';
import 'package:hotel_app/feature/home/home_service.dart';

class HomeViewModel extends ChangeNotifier {
  
  //represent state of model
  final HomeService _homeService = HomeService.initial();
  
  int get count => _homeService.count;

  void increase() {
    _homeService.increase();
    notifyListeners();
  }
}
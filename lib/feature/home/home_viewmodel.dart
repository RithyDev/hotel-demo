import 'package:flutter/material.dart';
import 'package:hotel_app/feature/home/home_service.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/repository/user_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final UserRepository userRepo;
  //represent state of model
  final HomeService _homeService = HomeService.initial();

  HomeViewModel({required this.userRepo});
  
  int get count => _homeService.count;
  AsyncData<String>? get token => _homeService.token;

  void increase() {
    _homeService.increase();
    notifyListeners();
  }
  
}
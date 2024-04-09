import 'package:flutter/material.dart';
import 'package:hotel_app/feature/home/home_service.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/repository/user_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final UserRepository userRepo;
  //represent state of model
  final HomeService _homeService = HomeService.initial();

  HomeViewModel({required this.userRepo}) {
    getToken();
  }
  
  int get count => _homeService.count;
  AsyncData<String>? get token => _homeService.token;

  void increase() {
    _homeService.increase();
    notifyListeners();
  }

  void getToken() async {
    setToken(Loading());
    try {
      final token = await userRepo.getToken();
      setToken(Success(token??'token not found'));
    } catch (e){
      setToken(Success('Token not found'));
    }
  
  }

  void setToken(AsyncData<String> newValue) {
    _homeService.setToken(newValue);
    notifyListeners();
  }
}
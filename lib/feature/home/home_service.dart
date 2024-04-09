//Home page model state
import 'package:hotel_app/model/async_data.dart';

class HomeService {

  int _count = 0;
  int get count => _count;
  
  AsyncData<String>? _token;
  AsyncData<String>? get token => _token;

  HomeService();
  
  void increase() {
    _count++;
  }

  void setToken(AsyncData<String> newValue) {
    _token = newValue;
  }
  
  factory HomeService.initial() => HomeService();
}
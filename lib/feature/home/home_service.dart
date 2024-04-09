//Home page model state
class HomeService {
  int _count = 0;
  int get count => _count;

  HomeService();
  
  void increase() {
    _count++;
  }
  
  factory HomeService.initial() => HomeService();
}
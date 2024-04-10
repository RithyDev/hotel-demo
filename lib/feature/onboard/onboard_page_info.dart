import 'package:hotel_app/resource/image_resource.dart';

class OnboardPageInfo {
  
  final String title;
  final String description;
  final String imageCover;
  
  OnboardPageInfo({
    
    required this.title,
    required this.description,
    required this.imageCover
  });
}

List<OnboardPageInfo> getPagesInfo() {
  return  [
    OnboardPageInfo(
        imageCover: ImageSource.imgOnboard1,
        title: 'Booking Hotels Anywhere is Easier',
        description: 'Anywhere in the world, we always with you'),
    OnboardPageInfo(
        imageCover: ImageSource.imgOnboard2,
        title: 'Plan Your Vacation With\nEase',
        description: 'There are places to discover'),
    OnboardPageInfo(
        imageCover: ImageSource.imgOnboard3,
        title: 'Thousands Of Hotels To Be Found',
        description: 'Only for you, and anyone you loved')
  ];
}
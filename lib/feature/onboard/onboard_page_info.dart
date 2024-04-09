class OnboardPageInfo {
  final String imageUrl;
  final String title;
  final String description;
  
  OnboardPageInfo({
    required this.imageUrl,
    required this.title,
    required this.description
  });
}

List<OnboardPageInfo> getPagesInfo() {
  return  [
    OnboardPageInfo(
        imageUrl:
            'https://i.pinimg.com/originals/c2/cb/54/c2cb54caa9d8a31c2fdfe0640e702ff5.jpg',
        title: 'Booking hotel all around the world',
        description: 'Anywhere in the world, we always with you'),
    OnboardPageInfo(
        imageUrl:
            'https://e0.pxfuel.com/wallpapers/303/921/desktop-wallpaper-brilliant-travel-accessories-iphone-travel-travel-iphone-travel-quote-phone.jpg',
        title: 'Explore the world with us',
        description: 'There are places to discover'),
    OnboardPageInfo(
        imageUrl:
            'https://wallpapercave.com/wp/wp5053460.jpg',
        title: 'Special Price',
        description: 'Only for you, and anyone you loved')
  ];
}
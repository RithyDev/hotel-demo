class HotelModel {
  final double price;
  final String name;
  final String address;
  final String thumnail;
  final int totalReview;
  final double rate;
  final int bed;
  final bool hasPool;
  final bool hasWifi;
  final List<String> images;
  bool isSavedFavite = false;


  HotelModel(
      {required this.name,
      required this.price,
      required this.address,
      required this.thumnail,
      required this.totalReview,
      required this.rate,
      required this.bed,
      required this.hasPool,
      required this.hasWifi,
      required this.images,
      required this.isSavedFavite});
}

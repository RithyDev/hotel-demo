import 'package:json_annotation/json_annotation.dart';

part 'hotel_model.g.dart';

@JsonSerializable()
class HotelInfo {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'thumbnail')
  final String thumbnail;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'images')
  final List<String> images;

  @JsonKey(name: 'price')
  final double price;

  @JsonKey(name: 'total_review')
  final int totalReview;

  @JsonKey(name: 'rate')
  final double rate;

  @JsonKey(name: 'bed')
  final int bed;
  
  @JsonKey(name: 'hasPool')
  final bool hasPool;

  @JsonKey(name: 'hasWifi')
  final bool hasWifi;
  

  HotelInfo({
    required this.name,
    required this.thumbnail,
    required this.address,
    required this.images,
    required this.price,
    required this.totalReview,
    required this.rate,
    required this.bed,
    required this.hasPool,
    required this.hasWifi
  });

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}

@JsonSerializable()
class HomeInfoData {
  
  @JsonKey(name: 'nearby')
  final List<HotelInfo> nearby;

  @JsonKey(name: 'recommented_hotels')
  final List<HotelInfo> recommended;

  HomeInfoData({required this.nearby, required this.recommended});


  factory HomeInfoData.fromJson(Map<String, dynamic> json) =>
      _$HomeInfoDataFromJson(json);
  
}

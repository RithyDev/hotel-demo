// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelInfo _$HotelInfoFromJson(Map<String, dynamic> json) => HotelInfo(
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String,
      address: json['address'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as num).toDouble(),
      totalReview: json['total_review'] as int,
      rate: (json['rate'] as num).toDouble(),
      bed: json['bed'] as int,
      hasPool: json['hasPool'] as bool,
      hasWifi: json['hasWifi'] as bool,
    );

Map<String, dynamic> _$HotelInfoToJson(HotelInfo instance) => <String, dynamic>{
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'address': instance.address,
      'images': instance.images,
      'price': instance.price,
      'total_review': instance.totalReview,
      'rate': instance.rate,
      'bed': instance.bed,
      'hasPool': instance.hasPool,
      'hasWifi': instance.hasWifi,
    };

HomeInfoData _$HomeInfoDataFromJson(Map<String, dynamic> json) => HomeInfoData(
      nearby: (json['nearby'] as List<dynamic>)
          .map((e) => HotelInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommended: (json['recommented_hotels'] as List<dynamic>)
          .map((e) => HotelInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeInfoDataToJson(HomeInfoData instance) =>
    <String, dynamic>{
      'nearby': instance.nearby,
      'recommented_hotels': instance.recommended,
    };

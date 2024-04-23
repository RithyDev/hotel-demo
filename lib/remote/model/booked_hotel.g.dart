// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookedHotel _$BookedHotelFromJson(Map<String, dynamic> json) => BookedHotel(
      id: json['id'] as String,
      checkinDate: json['checkinDate'] as String,
      checkoutDate: json['checkoutDate'] as String,
      hotel: HotelInfo.fromJson(json['hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookedHotelToJson(BookedHotel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'checkinDate': instance.checkinDate,
      'checkoutDate': instance.checkoutDate,
      'hotel': instance.hotel,
    };

BookingHistoryResponse _$BookingHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    BookingHistoryResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => BookedHotel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingHistoryResponseToJson(
        BookingHistoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

import 'package:hotel_app/remote/model/hotel_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booked_hotel.g.dart'; // This is the generated file

@JsonSerializable()
class BookedHotel {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'checkinDate')
  String checkinDate;

  @JsonKey(name: 'checkoutDate')
  String checkoutDate;

  @JsonKey(name: 'hotel')
  HotelInfo hotel;

  BookedHotel({
    required this.id,
    required this.checkinDate,
    required this.checkoutDate,
    required this.hotel
  });

  factory BookedHotel.fromJson(Map<String, dynamic> json) =>
      _$BookedHotelFromJson(json);

  Map<String, dynamic> toJson() => _$BookedHotelToJson(this);
}

@JsonSerializable()
class BookingHistoryResponse {
  
  final List<BookedHotel> data;

  BookingHistoryResponse({required this.data});

  factory BookingHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingHistoryResponseFromJson(json);
  
}
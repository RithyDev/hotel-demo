import 'dart:convert';

import 'package:hotel_app/core/assets_json_reader.dart';
import 'package:hotel_app/remote/model/booked_hotel.dart';

class HistoryRepository {

  final JsonAssetReader jsonReader;
  HistoryRepository({required this.jsonReader}); 

  Future<List<BookedHotel>> geBookingHistory() async {
    String jsonString = await jsonReader.getJson(path: 'hotel_booked_info.json');
    await Future.delayed(const Duration(seconds: 1));
    var json = jsonDecode(jsonString);
    var response = BookingHistoryResponse.fromJson(json);
    return response.data;
  }
}
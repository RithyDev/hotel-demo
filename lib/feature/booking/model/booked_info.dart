import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';
import 'package:hotel_app/remote/model/booked_hotel.dart';
import 'package:hotel_app/widget/date_time_utils.dart';

class HotelBookedInfo {
  final String bookedId;
  final DateTime? checkInDate;
  final DateTime? checkoutDate;
  final HotelModel hotelInfo;

  HotelBookedInfo(
      {required this.bookedId,
      required this.checkInDate,
      required this.checkoutDate,
      required this.hotelInfo});
}

extension HotelBookingMapper on BookedHotel {
  HotelBookedInfo mapToModel() {
    return HotelBookedInfo(
        bookedId: id,
        checkInDate: DateTimeUtil.fromDateString(checkinDate),
        checkoutDate: DateTimeUtil.fromDateString(checkoutDate),
        hotelInfo: HotelModel(
            address: hotel.address,
            bed: hotel.bed,
            hasPool: hotel.hasPool,
            images: hotel.images,
            name: hotel.name,
            hasWifi: hotel.hasWifi,
            price: hotel.price,
            rate: hotel.rate,
            isSavedFavite: false,
            thumnail: hotel.thumbnail,
            totalReview: hotel.totalReview));
  }
}

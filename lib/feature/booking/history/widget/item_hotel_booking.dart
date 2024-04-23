import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/model/booked_info.dart';
import 'package:hotel_app/feature/home/widget/item_hotel_nearby.dart';
import 'package:hotel_app/widget/date_time_utils.dart';

class ItemBookedHotel extends StatelessWidget {
  final HotelBookedInfo model;
  const ItemBookedHotel({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ItemHotelNearby(
            model: model.hotelInfo,
            autoEnabledPressed: false,
            backgroundColor: Colors.transparent,
          ),
          _renderDate()
        ],
      ),
    );
  }

  Widget _renderDate() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _renderDateInfo(
                'Check in', model.checkInDate?.dayMonthFormat() ?? ''),
            const Icon(Icons.arrow_forward),
            _renderDateInfo(
                'Check out', model.checkoutDate?.dayMonthFormat() ?? '')
          ],
        ),
      ),
    );
  }

  Widget _renderDateInfo(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

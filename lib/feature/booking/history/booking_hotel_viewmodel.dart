import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/feature/booking/model/booked_info.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/repository/history_repository.dart';

class BookingHistoryViewModel extends ChangeNotifier {
  final HistoryRepository repo;

  AsyncData<List<HotelBookedInfo>>? _bookedListing;
  AsyncData<List<HotelBookedInfo>>? get bookedLising => _bookedListing;

  BookingHistoryViewModel._({required this.repo}) {
    loadData();
  }

  Future<void> loadData() async {
    setState(() {
      _bookedListing = Loading();
    });
    var res = await repo.geBookingHistory();
    var items = res.map((item) => item.mapToModel()).toList();
    setState(() {
      _bookedListing = Success(items);
    });
  }

  void setState(VoidCallback fn) {
    fn();
    notifyListeners();
  }

  factory BookingHistoryViewModel.createNewInstance() {
    return BookingHistoryViewModel._(repo: GetIt.I.get());
  }
}

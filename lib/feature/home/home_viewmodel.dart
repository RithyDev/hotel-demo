import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/remote/model/hotel_model.dart';
import 'package:hotel_app/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository homeRepo;
  AsyncData<HomeInfoData>? _data;
  AsyncData<HomeInfoData>? get data => _data;

  List<HotelModel>? _recommendedHotels;
  List<HotelModel>? _nearbyHotels;

  HomeViewModel({required this.homeRepo}) {
    loadData();
  }

  void loadData() async {
    try {
      setDataState(Loading());
      var data = await homeRepo.getHomePageInfo();
      setDataState(Success(data));
    } on Exception catch (e) {
      setDataState(Fail(e));
    }
  }

  void setDataState(AsyncData<HomeInfoData> newState) {
    _data = newState;
    _nearbyHotels = _nearBy;
    _recommendedHotels = _recommended;
    notifyListeners();
  }

  List<HotelModel> get _nearBy {
    var items = data?.data?.nearby.map((item) => mapFrom(item)).toList();
    return items ?? [];
  }

  List<HotelModel> get nearBy => _nearbyHotels ?? [];

  List<HotelModel> get _recommended {
    var items = data?.data?.recommended.map((item) => mapFrom(item)).toList();
    return items ?? [];
  }

  List<HotelModel> get recommended => _recommendedHotels ?? [];

  HotelModel mapFrom(HotelInfo item) {
    return HotelModel(
        name: item.name,
        price: item.price,
        address: item.address,
        thumnail: item.thumbnail,
        totalReview: item.totalReview,
        rate: item.rate,
        bed: item.bed,
        hasPool: item.hasPool,
        hasWifi: item.hasWifi,
        images: item.images,
        isSavedFavite: false);
  }

  factory HomeViewModel.createNewInstance() {
    var repo = GetIt.I<HomeRepository>();
    return HomeViewModel(homeRepo: repo);
  }
}

import 'dart:convert';
import 'package:hotel_app/core/assets_json_reader.dart';
import 'package:hotel_app/remote/model/hotel_model.dart';


class HomeRepository {

  final JsonAssetReader jsonReader;
  HomeRepository({required this.jsonReader});

  Future<HomeInfoData> getHomePageInfo() async {    
    String jsonString = await jsonReader.getJson(path: 'home_page_info.json');
    var json = jsonDecode(jsonString);
    await Future.delayed(const Duration(seconds: 1));
    HomeInfoData dataModel = HomeInfoData.fromJson(json);
    return dataModel;
  } 
}
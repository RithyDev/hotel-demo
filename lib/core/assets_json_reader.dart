import 'package:flutter/material.dart';

class JsonAssetReader {
  BuildContext context;

  JsonAssetReader(this.context);

  Future<String> getJson({required String path}) async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('assets/json/$path');
    return jsonString;
  }
}
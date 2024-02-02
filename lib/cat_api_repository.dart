import 'package:cat_facts_example/cat_api_service.dart';
import 'package:cat_facts_example/cat_data_model.dart';
import 'package:flutter/material.dart';

class CatApiRepository {
  Future<List<CatDataModel?>> fetchCatData() async {
    try {
      final List<String> catUrls = [
        "https://api.thecatapi.com/v1/images/search",
        "https://meowfacts.herokuapp.com/",
      ];
      List<CatDataModel?> catList = [];

      for (String url in catUrls) {
        final CatDataModel? catData = await CatApiService.fetchCatDataList(url);
        if (catData != null) {
          catList.add(catData);
        }
      }
      return catList;
    } catch (e) {
      debugPrint("Failed to fetch Cat data $e");
      return [];
    }
  }
}

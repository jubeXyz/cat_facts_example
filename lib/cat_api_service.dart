import 'dart:convert';

import 'package:cat_facts_example/cat_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CatApiService {
  static Future<CatDataModel?> fetchCatDataList(String url) async {
    try {
      final Response response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        final apiData = json.decode(response.body);

        if (url.contains("thecatapi")) {
          return CatImageModel(url: apiData[0]["url"]);
        } else if (url.contains("meowfacts")) {
          final data = apiData["data"] as List<dynamic>;
          return CatFactModel(data: data[0]);
        }
      } else {
        throw Exception("Can't find Api Endpoint for $url");
      }
    } catch (e) {
      debugPrint("Failed to fetch Cat data from $url: $e");
    }
    return null;
  }
}

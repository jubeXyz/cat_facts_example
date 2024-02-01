import 'dart:convert';

import 'package:cat_facts_example/cat_data_model.dart';
import 'package:http/http.dart';

class CatApiService {
  static Future<CatDataModel?> fetchCatDataList(String url) async {
    try {
      final Response response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> apiData = json.decode(response.body);

        if (url.contains("thecatapi")) {
          return CatImageModel(url: apiData[0]["url"]);
        } else if (url.contains("meowfacts")) {
          return CatFactModel(data: apiData["data"]);
        } else {
          throw Exception("Can't find Api Endpoint for $url");
        }
      } else {
        throw Exception("Failed to load Cat data from $url");
      }
    } catch (e) {
      print("Failed to fetch Cat data from $url: $e");
    }
    return null;
  }
}

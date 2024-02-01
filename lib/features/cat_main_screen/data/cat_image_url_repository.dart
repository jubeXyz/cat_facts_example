import 'dart:convert';

import 'package:cat_facts_example/common/data/helpers.dart';

class CatImageUrlRepository {
  final catImageUri = 'https://api.thecatapi.com/v1/images/search';

  Future<String> getCatImageUrl() async {
    final jsonString = await getDataFromApi(catImageUri);
    await Future.delayed(const Duration(seconds: 3));

    final jsonObject = jsonDecode(jsonString);

    return jsonObject[0]['url'];
  }
}

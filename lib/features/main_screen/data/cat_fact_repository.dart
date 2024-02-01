import 'dart:convert';

import 'package:cat_facts_example/common/data/helpers.dart';

class CatFactRepository {
  final catFactUri = 'https://meowfacts.herokuapp.com/';

  Future<String> getCatFact() async {
    final jsonString = await getDataFromApi(catFactUri);

    final jsonObject = jsonDecode(jsonString);

    final catFact = jsonObject['data'][0];

    return catFact;
  }
}

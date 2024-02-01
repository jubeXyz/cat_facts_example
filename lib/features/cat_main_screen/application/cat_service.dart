import 'package:cat_facts_example/features/cat_main_screen/domain/cat_data.dart';

abstract class CatService {
  Future<CatData> getCatData();
}

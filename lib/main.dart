import 'package:cat_facts_example/features/main_screen/data/cat_fact_repository.dart';
import 'package:cat_facts_example/features/main_screen/data/cat_image_url_repository.dart';
import 'package:cat_facts_example/features/main_screen/presentation/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final catFactRepository = CatFactRepository();
  final catImageUrlRepository = CatImageUrlRepository();
  runApp(MainScreen(
    catFactRepository: catFactRepository,
    catImageUrlRepository: catImageUrlRepository,
  ));
}

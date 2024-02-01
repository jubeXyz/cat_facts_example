import 'package:cat_facts_example/features/cat_main_screen/application/parallel_cat_service.dart';
import 'package:cat_facts_example/features/cat_main_screen/data/cat_fact_repository.dart';
import 'package:cat_facts_example/features/cat_main_screen/data/cat_image_url_repository.dart';
import 'package:cat_facts_example/features/cat_main_screen/presentation/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final catFactRepository = CatFactRepository();
  final catImageUrlRepository = CatImageUrlRepository();
  final catService = ParallelCatService(
      catFactRepository: catFactRepository,
      catImageUrlRepository: catImageUrlRepository);

  runApp(MainScreen(catService: catService));
}

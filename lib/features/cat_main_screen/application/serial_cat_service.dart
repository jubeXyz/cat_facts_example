import 'package:cat_facts_example/features/cat_main_screen/application/cat_service.dart';
import 'package:cat_facts_example/features/cat_main_screen/data/cat_fact_repository.dart';
import 'package:cat_facts_example/features/cat_main_screen/data/cat_image_url_repository.dart';
import 'package:cat_facts_example/features/cat_main_screen/domain/cat_data.dart';

class SerialCatService implements CatService {
  final CatFactRepository catFactRepository;
  final CatImageUrlRepository catImageUrlRepository;

  SerialCatService({
    required this.catFactRepository,
    required this.catImageUrlRepository,
  });

  @override
  Future<CatData> getCatData() async {
    final catFact = await catFactRepository.getCatFact();
    final catImage = await catImageUrlRepository.getCatImageUrl();

    return CatData(imageUrl: catImage, catFact: catFact);
  }
}

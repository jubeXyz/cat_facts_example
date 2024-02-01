import 'package:cat_facts_example/features/cat_main_screen/application/cat_service.dart';
import 'package:cat_facts_example/features/cat_main_screen/data/cat_fact_repository.dart';
import 'package:cat_facts_example/features/cat_main_screen/data/cat_image_url_repository.dart';
import 'package:cat_facts_example/features/cat_main_screen/domain/cat_data.dart';

class ParallelCatService implements CatService {
  final CatFactRepository catFactRepository;
  final CatImageUrlRepository catImageUrlRepository;

  ParallelCatService({
    required this.catFactRepository,
    required this.catImageUrlRepository,
  });

  @override
  Future<CatData> getCatData() async {
    String catFact = ""; //await catFactRepository.getCatFact();
    String catImage = ""; // await catImageUrlRepository.getCatImageUrl();

    final catFactFuture = catFactRepository.getCatFact();
    final catImageFuture = catImageUrlRepository.getCatImageUrl();

    await Future.wait([catFactFuture, catImageFuture]).then(
      (futureResults) {
        catFact = futureResults[0];
        catImage = futureResults[1];
      },
    );

    return CatData(imageUrl: catImage, catFact: catFact);
  }
}

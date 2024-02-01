abstract class CatDataModel {
  String? data;
  String? url;

  CatDataModel({
    this.data,
    this.url,
  });
}

class CatFactModel extends CatDataModel {
  CatFactModel({
    required super.data,
  });
}

class CatImageModel extends CatDataModel {
  CatImageModel({
    required super.url,
  });
}

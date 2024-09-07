class Product {
  String id;
  String title;
  String description;
  String category;
  double unitPrice;
  List<String> images;
  String sku;
  String slug;
  int inventory;
  DateTime lastUpdate;
  String productCollection;
  bool promotion;
  List<String> features;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.unitPrice,
    required this.images,
    required this.sku,
    required this.slug,
    required this.inventory,
    required this.lastUpdate,
    required this.productCollection,
    required this.promotion,
    required this.features,
  });
}

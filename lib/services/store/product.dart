class Product {
  String title;
  String description;
  double unitPrice;
  List<String> images;
  String sku;
  String slug;
  int inventory;
  DateTime lastUpdate;
  String productCollection;
  bool promotion;

  Product({
    required this.title,
    required this.description,
    required this.unitPrice,
    required this.images,
    required this.sku,
    required this.slug,
    required this.inventory,
    required this.lastUpdate,
    required this.productCollection,
    required this.promotion,
  });
}

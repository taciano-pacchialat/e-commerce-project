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
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<dynamic> imagesJson = json['images'] ?? [];
    List<String> imagesList =
        imagesJson.map((e) => e['image'] as String).toList();

    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      unitPrice: json['unit_price'],
      images: imagesList,
      sku: json['sku'],
      slug: json['slug'],
      inventory: json['inventory'],
      lastUpdate: json['last_update'],
    );
  }
}

import 'package:e_commerce_project/services/store/product.dart';

class ProductCache {
  static final ProductCache _instance = ProductCache._internal();
  factory ProductCache() => _instance;
  ProductCache._internal();

  // categoryId, list of all the products in the category
  final Map<String, List<Product>> _cache = {};

  void initializeCache(List<Product> products) {
    for (var product in products) {
      if (_cache[product.category] == null) {
        _cache[product.category] = [];
      }
      _cache[product.category]!.add(product);
    }
  }

  List<Product>? getAllProducts() {
    return _cache.values.expand((element) => element).toList();
  }

  List<Product>? getProducts(String categoryId) {
    return _cache[categoryId];
  }
}

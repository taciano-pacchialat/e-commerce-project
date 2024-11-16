import 'package:e_commerce_project/services/cloud/cloud_service.dart';
import 'package:e_commerce_project/services/cloud/product.dart';

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

  void updateCategoryCache(String categoryId, List<Product> products) {
    _cache[categoryId] = products;
  }

  Future<void> fetchAndCacheProducts() async {
    try {
      List<Product> products = await getProducts('');
      initializeCache(products);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Product>> getProducts(String categoryId) async {
    if (_cache.containsKey(categoryId)) {
      return _cache[categoryId]!;
    } else {
      // Fetch products from CloudService if not in cache
      List<Product> products =
          await CloudService().fetchProductsByCategory(categoryId);
      updateCategoryCache(categoryId, products);
      return products;
    }
  }
}

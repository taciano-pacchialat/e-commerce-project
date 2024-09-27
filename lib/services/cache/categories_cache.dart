import 'package:e_commerce_project/services/store/category.dart';

class CategoriesCache {
  static final CategoriesCache _instance = CategoriesCache._internal();
  factory CategoriesCache() => _instance;
  CategoriesCache._internal();

  final Map<String, Category> _cache = {};

  void initializeCache(List<Category> categories) {
    for (var category in categories) {
      _cache[category.id] = category;
    }
  }

  Category? getCategory(String id) {
    return _cache[id];
  }

  String? getCategoryName(String id) {
    return _cache[id]?.name;
  }

  String? getCategoryId(String name) {
    String? id;
    _cache.forEach(
      (key, value) {
        if (value.name == name) {
          id = key;
          return;
        }
      },
    );
    return id;
  }

  void clearCache() {
    _cache.clear();
  }

  bool containsCategory(String id) {
    return _cache.containsKey(id);
  }

  List<Category> getAllCategories() {
    return _cache.values.toList();
  }
}

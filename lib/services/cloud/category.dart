class Category {
  final String id;
  final String name;
  final int items;
  final List<Category> subCategories;

  Category({
    required this.id,
    required this.name,
    required this.items,
    this.subCategories = const [],
  });
}

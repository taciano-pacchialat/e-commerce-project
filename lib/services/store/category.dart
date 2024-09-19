class Category {
  final String name;
  final int items;
  final List<Category> subCategories;

  Category({
    required this.name,
    required this.items,
    this.subCategories = const [],
  });
}

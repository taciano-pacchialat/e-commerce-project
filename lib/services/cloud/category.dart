class Category {
  final String id;
  final String name;
  final int items;

  Category({
    required this.id,
    required this.name,
    required this.items,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      items: json['items'],
    );
  }
}

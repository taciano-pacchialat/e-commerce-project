import 'package:e_commerce_project/services/store/product.dart';
import 'package:e_commerce_project/views/store/product_card.dart';
import 'package:flutter/material.dart';

// Displays the item grid, getting the items and the categoryId
// as an optional parameter. That is so that the widget can be
// used to show not only the products of a certain category but
// all the products.
class ItemGrid extends StatelessWidget {
  final String? categoryId;
  final List<Product> items;

  const ItemGrid({
    super.key,
    required this.items,
    this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          int crossAxisCount;
          double childAspectRatio;

          if (screenWidth > 650) {
            crossAxisCount = 4;
          } else if (screenWidth > 525) {
            crossAxisCount = 3;
          } else {
            crossAxisCount = 2;
          }

          childAspectRatio = (screenHeight / screenWidth * 0.3).clamp(0.5, 0.8);

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: items.elementAt(index),
              );
            },
          );
        },
      ),
    );
  }
}

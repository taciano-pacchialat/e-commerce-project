import 'package:e_commerce_project/services/cache/product_cache.dart';
import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/widgets/custom_search_delegate.dart';
import 'package:e_commerce_project/widgets/product_card.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Charly\'s Hideout',
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate:
                    CustomSearchDelegate(ProductCache().getAllProducts()!),
              );
            },
          ),
        ),
      ],
      body: Padding(
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

            childAspectRatio =
                (screenHeight / screenWidth * 0.3).clamp(0.5, 0.8);

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: ProductCache().getAllProducts()?.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: ProductCache().getAllProducts()!.elementAt(index),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: StoreView(),
  ));
}

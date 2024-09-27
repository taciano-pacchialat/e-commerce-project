import 'package:e_commerce_project/services/cache/product_cache.dart';
import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:e_commerce_project/widgets/item_grid.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/widgets/custom_search_delegate.dart';

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
      body: ItemGrid(
        items: ProductCache().getAllProducts()!,
      ),
    );
  }
}

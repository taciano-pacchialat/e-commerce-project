import 'package:e_commerce_project/services/bloc/navigation_bloc.dart';
import 'package:e_commerce_project/services/bloc/navigation_states.dart';
import 'package:e_commerce_project/services/cache/product_cache.dart';
import 'package:e_commerce_project/services/cloud/product.dart';
import 'package:e_commerce_project/views/store/filter_section.dart';
import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:e_commerce_project/views/store/item_grid.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/views/store/custom_search_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        String selectedCategoryId = '';
        List<Product> products = [];

        if (state is StoreState) {
          selectedCategoryId = state.categoryId;
          products = selectedCategoryId.isEmpty
              ? ProductCache().getAllProducts() ?? []
              : (ProductCache().getProducts(selectedCategoryId)
                      as List<Product>?) ??
                  [];
        }

        return BaseScaffold(
          title: 'Charly\'s Hideout',
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(products),
                );
              },
            ),
          ],
          body: ListView(
            children: [
              // Filter section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilterSection(
                  selectedCategoryId: selectedCategoryId,
                ),
              ),
              // Product grid or no products message
              products.isNotEmpty
                  ? ItemGrid(
                      items: products,
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.sentiment_dissatisfied),
                            const SizedBox(height: 16.0),
                            Text(
                              'No Products Available',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.grey[700],
                                    fontSize: 18.0,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Please select another category',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                    fontSize: 14.0,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:e_commerce_project/services/bloc/navigation_bloc.dart';
import 'package:e_commerce_project/services/bloc/navigation_events.dart';
import 'package:e_commerce_project/services/bloc/navigation_states.dart';
import 'package:e_commerce_project/services/cache/categories_cache.dart';
import 'package:e_commerce_project/services/cache/product_cache.dart';
import 'package:e_commerce_project/services/store/product.dart';
import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:e_commerce_project/views/store/item_grid.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/views/store/custom_search_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        List<Product>? products;
        String? categoryName = '';
        if (state is StoreState) {
          categoryName = CategoriesCache().getCategoryName(state.categoryId);
          products = state.categoryId == ''
              ? ProductCache().getAllProducts()!
              : ProductCache().getProducts(state.categoryId);
        }

        // Handle null or empty products case
        if (products == null || products.isEmpty) {
          return const BaseScaffold(
            title: 'Charly\'s Hideout',
            body: Center(
              child:
                  Text('No products available', style: TextStyle(fontSize: 18)),
            ),
          );
        } else {
          var logger = Logger();
          logger.i('Products: $products');
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
                      delegate: CustomSearchDelegate(products!),
                    );
                  },
                ),
              ),
            ],
            body: Column(
              children: [
                // Filter section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (products.isNotEmpty)
                        Expanded(
                          child: Chip(
                            label: Text('Filter: $categoryName'),
                            onDeleted: () {
                              BlocProvider.of<NavigationBloc>(context).add(
                                const NavigateToStore(categoryId: ''),
                              );
                            },
                            deleteIcon: const Icon(Icons.clear),
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                      DropdownButton<String>(
                        value: categoryName,
                        hint: const Text('Select Category'),
                        items: CategoriesCache()
                            .getAllCategories()
                            .map((category) => category.name)
                            .toList()
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          String? newId =
                              CategoriesCache().getCategoryId(newValue!);
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigateToStore(categoryId: newId!));
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ItemGrid(
                    items: products,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

import 'package:e_commerce_project/services/cache/categories_cache.dart';
import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/constants/app_colors.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  // every category's state (if not expanded, state = false, else true)
  final List<bool> _expandedStates =
      List.filled(CategoriesCache().getAllCategories().length, false);

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesCache().getAllCategories();

    return BaseScaffold(
      title: 'Categories',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              color: AppColors.primaryCream,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: AppColors.secondaryGold),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ExpansionTile(
                title: Text(
                  category.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 18.0),
                ),
                subtitle: Text(
                  '${category.items} items',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: Icon(
                  _expandedStates[index]
                      ? Icons.expand_less
                      : Icons.expand_more,
                  color: AppColors.secondaryGold,
                ),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _expandedStates[index] = expanded;
                  });
                },
                children: category.subCategories.map(
                  (subCategory) {
                    return ListTile(
                      title: Text(
                        subCategory.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16.0,
                            ),
                      ),
                      subtitle: Text(
                        '${subCategory.items} items',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

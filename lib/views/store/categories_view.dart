import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:e_commerce_project/mock/mock_categories.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: AppColors.secondaryGreen,
                  child: Icon(Icons.category, color: AppColors.primaryCream),
                ),
                title: Text(
                  category.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  '${category.items} items',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: AppColors.secondaryGold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

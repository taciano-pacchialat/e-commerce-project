import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:e_commerce_project/services/bloc/navigation_bloc.dart';
import 'package:e_commerce_project/services/bloc/navigation_events.dart';
import 'package:e_commerce_project/services/cache/categories_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterSection extends StatelessWidget {
  final String selectedCategoryId;

  const FilterSection({
    super.key,
    required this.selectedCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesCache().getAllCategories();
    final categoryNames = categories.map((e) => e.name).toList();
    final selectedCategoryName =
        CategoriesCache().getCategoryName(selectedCategoryId);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.end,
          // spacing: 12.0,
          // runSpacing: 12.0,
          children: [
            if (selectedCategoryName != null)
              Chip(
                label: Text(
                  'Filter: $selectedCategoryName',
                  style: const TextStyle(color: Colors.white),
                ),
                deleteIcon: const Icon(Icons.clear, color: Colors.white),
                backgroundColor: Colors.grey[600],
                onDeleted: () {
                  // Clear filter by navigating to store with empty category
                  BlocProvider.of<NavigationBloc>(context).add(
                    const NavigateToStore(categoryId: ''),
                  );
                },
              ),
            DropdownButton<String>(
              value: selectedCategoryName,
              hint: const Text('Select Category'),
              items:
                  categoryNames.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                final newId = CategoriesCache().getCategoryId(newValue ?? '');
                if (newId != null) {
                  BlocProvider.of<NavigationBloc>(context).add(
                    NavigateToStore(categoryId: newId),
                  );
                }
              },
              style: Theme.of(context).textTheme.bodySmall,
              dropdownColor: AppColors.primaryCream,
              underline: Container(
                height: 2,
                color: AppColors.primaryBurgundy,
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.primaryBurgundy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

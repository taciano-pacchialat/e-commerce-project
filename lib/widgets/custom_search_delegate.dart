import 'package:flutter/material.dart';
import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:e_commerce_project/services/store/product.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Product> data;

  CustomSearchDelegate(this.data);

  //TODO change the font weight of the search prompt

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryBurgundy,
        elevation: 10.0,
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryCream),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(Icons.clear),
          color: AppColors.primaryCream,
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const IconTheme(
        data: IconThemeData(size: 22.0),
        child: Icon(
          Icons.arrow_back,
          color: AppColors.primaryCream,
        ),
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        color: AppColors.primaryCream,
        fontSize: 18,
        fontWeight: FontWeight.w100,
      );

  @override
  Widget buildResults(BuildContext context) {
    final results = data
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Card(
            color: const Color(
                0xFFF5F5DC), // Background color similar to the image
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFFC9A32C)), // Border color
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child: ListTile(
              leading: Image.network(
                product.images[0],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
              title: Text(
                product.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5C1A1B), // Text color
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.category), // Displaying category (e.g., Guitars)
                  Text(
                    '\$${product.unitPrice}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Price color
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = data
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final product = suggestions[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            child: Card(
              color: const Color(0xFFF5F5DC), // Background color
              shape: RoundedRectangleBorder(
                side:
                    const BorderSide(color: Color(0xFFC9A32C)), // Border color
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                leading: Image.network(
                  product.images[0],
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
                title: Text(
                  product.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5C1A1B),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category,
                    ), // Displaying category (e.g., Guitars)
                    Text(
                      '\$${product.unitPrice}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  query = suggestions[index].title;
                  showResults(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/services/store/product.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Charly\'s Hideout',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.primaryCream,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColors.primaryBurgundy,
        actions: const [],
      ),
      backgroundColor: AppColors.primaryCream,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                product.images[0],
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.secondaryGold,
                    child: const Center(
                      child: Icon(Icons.image_not_supported,
                          size: 50, color: AppColors.primaryBurgundy),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.unitPrice.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Specifications',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: product.features
                        .map<Widget>((spec) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                '• $spec',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: AppColors.primaryCream,
            border: Border(
                top: BorderSide(
              color: AppColors.secondaryGold,
              width: 1.0,
            ))),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryGold,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // Implement add to cart functionality
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Thank You!')),
            );
          },
          child: Text('Send a Whatsapp to Charly',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
    );
  }
}

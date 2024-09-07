import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:e_commerce_project/services/bloc/navigation_bloc.dart';
import 'package:e_commerce_project/services/bloc/navigation_events.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/services/store/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Charly\'s Hideout',
          style: TextStyle(
            color: AppColors.primaryCream,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.primaryCream,
          onPressed: () {
            BlocProvider.of<NavigationBloc>(context).add(NavigateToHome());
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
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBurgundy),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.category,
                    style: const TextStyle(
                        fontSize: 16, color: AppColors.accentBrown),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.unitPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryGreen),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBurgundy),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(
                        fontSize: 16, color: AppColors.accentBrown),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Specifications',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBurgundy),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: product.features
                        .map<Widget>((spec) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                '• $spec',
                                style: const TextStyle(
                                    fontSize: 16, color: AppColors.accentBrown),
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
          child: const Text(
            'Send a Whatsapp to Charly',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryBurgundy,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

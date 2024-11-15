import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/services/cloud/product.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int _current = 0; // Remove 'final' to allow updating the current index
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Charly\'s Hideout',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.primaryCream,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColors.primaryBurgundy,
      ),
      backgroundColor: AppColors.primaryCream,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Slider with Stack for overlays
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: CarouselSlider.builder(
                    carouselController: _carouselController,
                    itemCount: product.images.length,
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        product.images[index],
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.secondaryGold,
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: AppColors.primaryBurgundy,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 4 / 3,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                ),
                // Dots Indicator
                Positioned(
                  bottom: 16.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: product.images.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _carouselController.animateToPage(
                          entry.key,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        ),
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 4.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key
                                ? AppColors.secondaryGold
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                // Navigation Arrows
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 8.0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.grey,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      _carouselController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                    style: const ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 8.0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    color: Colors.grey,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      _carouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                    style: const ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                    ),
                  ),
                ),
              ],
            ),
            // Product Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '\$${product.unitPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Specifications',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
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
            ),
          ),
        ),
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
          child: Text(
            'Send a Whatsapp to Charly',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}

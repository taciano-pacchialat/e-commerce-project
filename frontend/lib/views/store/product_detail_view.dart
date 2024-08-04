import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/services/store/product.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  const ProductDetailView({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.08,
                right: screenWidth * 0.08,
                top: screenHeight * 0.01,
              ),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight * 0.7,
                viewportFraction: 0.98,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enableInfiniteScroll: false,
              ),
              items: product.images.map(
                (image) {
                  return Builder(
                    builder: (context) {
                      return Image.asset(image, fit: BoxFit.contain);
                    },
                  );
                },
              ).toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: screenWidth * 0.08,
              ),
              child: Text(
                '\$${product.unitPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenWidth * 0.02,
                bottom: 0.0,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

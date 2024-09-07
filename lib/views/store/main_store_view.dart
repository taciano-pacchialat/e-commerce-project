import 'package:e_commerce_project/constants/drawer_items.dart';
import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:e_commerce_project/widgets/custom_drawer.dart';
import 'package:e_commerce_project/widgets/custom_search_delegate.dart';
import 'package:e_commerce_project/services/store/product.dart';
import 'package:e_commerce_project/widgets/product_card.dart';

final List<Product> mockProducts = [
  Product(
    title: 'Fender Stratocaster',
    description: 'Classic electric guitar with a timeless sound.',
    category: 'Guitar',
    unitPrice: 1199.99,
    images: [
      'assets/images/fender-stratocaster/fender-stratocaster-1.jpg',
      'assets/images/fender-stratocaster/fender-stratocaster-2.jpg',
      'assets/images/fender-stratocaster/fender-stratocaster-3.jpg',
      'assets/images/fender-stratocaster/fender-stratocaster-4.jpg',
      'assets/images/fender-stratocaster/fender-stratocaster-5.jpg',
    ],
    sku: 'FEND-STRAT',
    slug: 'fender-stratocaster',
    inventory: 15,
    lastUpdate: DateTime.now(),
    productCollection: 'Guitars',
    promotion: true,
  ),
  Product(
    title: 'Gibson Les Paul',
    description: 'Iconic electric guitar known for its rich tone.',
    unitPrice: 2499.99,
    category: 'Guitar',
    images: [
      'assets/images/gibson-les-paul/gibson-les-paul-1.jpg',
      'assets/images/gibson-les-paul/gibson-les-paul-2.jpg',
      'assets/images/gibson-les-paul/gibson-les-paul-3.jpg',
      'assets/images/gibson-les-paul/gibson-les-paul-4.jpg',
    ],
    sku: 'GIBS-LESPAUL',
    slug: 'gibson-les-paul',
    inventory: 10,
    lastUpdate: DateTime.now(),
    productCollection: 'Guitars',
    promotion: false,
  ),
  Product(
    title: 'Fender Telecaster',
    description: 'Versatile electric guitar with a distinctive twang.',
    unitPrice: 999.99,
    category: 'Guitar',
    images: [
      'assets/images/fender-telecaster/fender-telecaster-1.jpeg',
    ],
    sku: 'FEND-TELE',
    slug: 'fender-telecaster',
    inventory: 8,
    lastUpdate: DateTime.now(),
    productCollection: 'Guitars',
    promotion: true,
  ),
  Product(
    title: 'Gibson SG',
    description: 'Classic electric guitar with a powerful sound.',
    unitPrice: 1999.99,
    category: 'Guitar',
    images: [
      'assets/images/gibson-sg/gibson-sg-1.jpeg',
    ],
    sku: 'GIBS-SG',
    slug: 'gibson-sg',
    inventory: 12,
    lastUpdate: DateTime.now(),
    productCollection: 'Guitars',
    promotion: false,
  ),
  Product(
    title: 'Shure SM58 Microphone',
    description: 'Legendary vocal microphone with excellent sound quality.',
    unitPrice: 99.99,
    category: 'Audio',
    images: [
      'assets/images/mic-shure/mic-shure-1.jpeg',
    ],
    sku: 'SHURE-SM58',
    slug: 'shure-sm58',
    inventory: 20,
    lastUpdate: DateTime.now(),
    productCollection: 'Audio',
    promotion: true,
  ),
  Product(
    title: 'Universal Audio Apollo Twin X',
    description: 'High-quality audio interface for professional recording.',
    unitPrice: 1299.99,
    category: 'Audio',
    images: [
      'assets/images/apollo-interface/apollo-interface-1.jpeg',
    ],
    sku: 'UA-APOLLO',
    slug: 'universal-audio-apollo-twin-x',
    inventory: 5,
    lastUpdate: DateTime.now(),
    productCollection: 'Audio',
    promotion: false,
  ),
  Product(
    title: 'Marshall JVM410H Amplifier',
    description: 'Versatile guitar amplifier with a wide range of tones.',
    unitPrice: 1999.99,
    category: 'Amplifier',
    images: [
      'assets/images/marshall-jvm410h/marshall-jvm410h-1.jpeg',
    ],
    sku: 'MARSH-JVM410H',
    slug: 'marshall-jvm410h',
    inventory: 7,
    lastUpdate: DateTime.now(),
    productCollection: 'Amplifiers',
    promotion: true,
  ),
  Product(
    title: 'Orange Rockerverb 50 MKIII',
    description: 'Powerful and versatile guitar amplifier head.',
    unitPrice: 2499.99,
    category: 'Amplifier',
    images: [
      'assets/images/orange-rockerverb50-mkii/orange-rockerverb50-mkii-1.jpeg',
    ],
    sku: 'ORANGE-RV50',
    slug: 'orange-rockerverb50-mkii',
    inventory: 3,
    lastUpdate: DateTime.now(),
    productCollection: 'Amplifiers',
    promotion: false,
  ),
];

class MainStoreView extends StatelessWidget {
  const MainStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BaseScaffold(
      title: 'Charly\'s Store',
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(mockProducts),
              );
            },
          ),
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: screenHeight / screenWidth * 0.55,
          ),
          itemCount: mockProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: mockProducts[index],
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MainStoreView(),
  ));
}

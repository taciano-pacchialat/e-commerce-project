import 'package:flutter/material.dart';
import 'package:frontend/services/store/product.dart';
import 'package:frontend/views/store/main_store_view.dart';

final strat = Product(
  title: 'Fender Stratocaster',
  description: 'Classic electric guitar with a timeless sound.',
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
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'E-Commerce',
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          size: 22.0,
        ),
      ),
    ),
    home: const HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainStoreView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

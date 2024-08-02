import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_search_delegate.dart';
import 'package:frontend/services/store/product.dart';

final List<Product> mockProducts = [
  Product(
    title: 'Fender Stratocaster',
    description: 'Classic electric guitar with a timeless sound.',
    unitPrice: 1199.99,
    images: [
      'assets/fender-stratocaster/fender-stratocaster-1.jpg',
      'assets/fender-stratocaster/fender-stratocaster-2.jpg',
      'assets/fender-stratocaster/fender-stratocaster-3.jpg',
      'assets/fender-stratocaster/fender-stratocaster-4.jpg',
      'assets/fender-stratocaster/fender-stratocaster-5.jpg',
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
    images: [
      'assets/gibson-les-paul/gibson-les-paul-1.jpg',
      'assets/gibson-les-paul/gibson-les-paul-2.jpg',
      'assets/gibson-les-paul/gibson-les-paul-3.jpg',
      'assets/gibson-les-paul/gibson-les-paul-4.jpg',
    ],
    sku: 'GIBS-LESPAUL',
    slug: 'gibson-les-paul',
    inventory: 10,
    lastUpdate: DateTime.now(),
    productCollection: 'Guitars',
    promotion: false,
  ),
];

class MainStoreView extends StatelessWidget {
  const MainStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        ),
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.zero,
              bottomRight: Radius.zero,
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.45,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.zero,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                onTap: () {
                  //TODO go to home screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite_border_rounded),
                title: const Text('Favorites'),
                onTap: () {
                  //TODO go to favorites
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                onTap: () {
                  //TODO go to settings
                },
              ),
            ],
          ),
        ),
        body: const Placeholder());
  }
}

void main() {
  runApp(MaterialApp(
    home: MainStoreView(),
  ));
}

import 'package:flutter/material.dart';
import 'package:frontend/services/store/product.dart';
import 'package:frontend/views/register/register_password_view.dart';
import 'package:frontend/views/register/register_email_view.dart';
import 'package:frontend/views/login/login_email_view.dart';
import 'package:frontend/views/login/login_password_view.dart';
import 'package:frontend/views/store/main_store_view.dart';
import 'package:frontend/views/store/product_detail_view.dart';

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginEmailView(),
                    ),
                  );
                },
                child: const Text('Login email view'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPasswordView(),
                    ),
                  );
                },
                child: const Text('Login password view'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterEmailView(),
                    ),
                  );
                },
                child: const Text('Register email view'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPasswordView(),
                    ),
                  );
                },
                child: const Text('Register password view'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainStoreView()),
                  );
                },
                child: const Text('Main store view'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailView(product: strat),
                    ),
                  );
                },
                child: const Text('Product Detail View'),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

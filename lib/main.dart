import 'package:flutter/material.dart';
import 'package:frontend/views/store/main_store_view.dart';

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

import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_search_delegate.dart';

class MainStoreView extends StatelessWidget {
  final List<String> items = ['Apple', 'Banana', 'Orange', 'Pineapple'];

  MainStoreView({super.key});

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
                    delegate: CustomSearchDelegate(items),
                  );
                },
              ),
            ),
          ],
        ),
        body: const Placeholder());
  }
}

void main() {
  runApp(MaterialApp(
    home: MainStoreView(),
  ));
}

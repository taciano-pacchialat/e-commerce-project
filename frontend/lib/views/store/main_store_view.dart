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

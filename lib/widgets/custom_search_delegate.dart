import 'package:flutter/material.dart';
import 'package:frontend/services/store/product.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Product> data;

  CustomSearchDelegate(this.data);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 10.0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(color: Colors.black, fontSize: 18),
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const IconTheme(
        data: IconThemeData(size: 22.0),
        child: Icon(Icons.arrow_back),
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = data
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].title),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = data
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
      ),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.only(
                left: 22.0,
                right: 22.0,
              ),
              child: Text(suggestions[index].title),
            ),
            onTap: () {
              query = suggestions[index].title;
              showResults(context);
            },
          );
        },
      ),
    );
  }
}

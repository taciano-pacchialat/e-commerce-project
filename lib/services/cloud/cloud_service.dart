import 'dart:convert';
import 'package:e_commerce_project/services/cloud/category.dart';
import 'package:e_commerce_project/services/cloud/cloud_exceptions.dart';
import 'package:e_commerce_project/services/cloud/product.dart';
import 'package:http/http.dart' as http;

class CloudService {
  final String _baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products/'));

      if (response.statusCode == 200) {
        try {
          List<dynamic> jsonData = json.decode(response.body);
          return jsonData.map((e) => Product.fromJson(e)).toList();
        } catch (e) {
          throw ParsingException('Error parsing products data.');
        }
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        throw ClientException(response.statusCode, 'Invalid request.');
      } else if (response.statusCode >= 500) {
        throw ServerException(response.statusCode, 'Server error.');
      } else {
        throw Exception('Unexpected error occurred.');
      }
    } on http.ClientException {
      throw NetworkException('No Internet connection.');
    } catch (e) {
      throw Exception('An unknown error occurred.');
    }
  }

  Future<List<Product>> fetchProductsByCategory(String categoryId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/products?category=$categoryId'),
      );

      if (response.statusCode == 200) {
        try {
          List<dynamic> jsonData = json.decode(response.body);
          return jsonData.map((e) => Product.fromJson(e)).toList();
        } catch (e) {
          throw ParsingException('Error parsing products data.');
        }
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        throw ClientException(response.statusCode, 'Invalid request.');
      } else if (response.statusCode >= 500) {
        throw ServerException(response.statusCode, 'Server error.');
      } else {
        throw Exception('Unexpected error occurred.');
      }
    } on http.ClientException {
      throw NetworkException('No Internet connection.');
    } catch (e) {
      throw Exception('An unknown error occurred.');
    }
  }

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/categories/'),
      );

      if (response.statusCode == 200) {
        try {
          List<dynamic> jsonData = json.decode(response.body);
          return jsonData.map((e) => Category.fromJson(e)).toList();
        } catch (e) {
          throw ParsingException('Error parsing products data.');
        }
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        throw ClientException(response.statusCode, 'Invalid request.');
      } else if (response.statusCode >= 500) {
        throw ServerException(response.statusCode, 'Server error.');
      } else {
        throw Exception('Unexpected error occurred.');
      }
    } on http.ClientException {
      throw NetworkException('No internet connection.');
    } catch (e) {
      throw Exception('An unknown error occured.');
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../Model/ProductsModel.dart';
import 'package:http/http.dart' as http;
class ProductViewModel extends ChangeNotifier {
  List<Products> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Products> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    final url = 'https://dummyjson.com/products?limit=100';
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _products = (data['products'] as List)
            .map((e) => Products.fromJson(e))
            .toList();
      } else {
        _errorMessage = 'Failed to load products. Status Code: ${response.statusCode}';
      }
    } catch (error) {
      _errorMessage = 'An error occurred: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

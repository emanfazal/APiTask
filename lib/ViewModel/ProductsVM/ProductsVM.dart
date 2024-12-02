import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../../Model/ProductsModel.dart';

class ProductViewModel extends ChangeNotifier {
  List<Products> _products = [];
  List<Products> _filteredProducts = []; // List for filtered products
  bool _isLoading = false;
  String _errorMessage = '';
  String _searchQuery = ''; // Store the search query

  List<Products> get products => _filteredProducts.isEmpty ? _products : _filteredProducts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  ProductViewModel() {
    // Automatically fetch products when the view model is instantiated
    fetchProducts();
  }

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
        _filteredProducts = List.from(_products); // Set the filtered list initially
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

  // Method to update the search query and filter products
  void searchProducts(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _filteredProducts = List.from(_products); // Reset to original products when query is empty
    } else {
      _filteredProducts = _products.where((product) {
        return product.title != null && product.title!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners(); // Notify listeners to update the UI
  }
}

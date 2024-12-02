import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/ProductsModel.dart';
import '../../ViewModel/ProductsVM/ProductsVM.dart';
import 'ProductCard.dart'; // Import the ProductCard widget

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);
  static String routeName = "/ProductView";

  @override
  Widget build(BuildContext context) {
    // Access the ProductViewModel via Provider
    final productViewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Products')),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...', // Optional hint text
                    prefixIcon: Icon(Icons.search), // Search icon inside the text field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                      borderSide: BorderSide(color: Colors.grey), // Border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue), // Border color when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey), // Border color when not focused
                    ),
                  ),
                ),
              ),
            ],
          ),

          productViewModel.isLoading
              ? const Center(child: CircularProgressIndicator()) // Show loading spinner
              : productViewModel.products.isEmpty
              ? const Center(child: Text('No products available.'))
              : ListView.builder(
            itemCount: productViewModel.products.length,
            itemBuilder: (context, index) {
              // Pass each product to the ProductCard widget
              return ProductCard( );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productViewModel.fetchProducts(); // Fetch products when refresh button is pressed
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

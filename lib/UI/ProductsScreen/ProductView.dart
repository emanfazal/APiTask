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
              TextField(),
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

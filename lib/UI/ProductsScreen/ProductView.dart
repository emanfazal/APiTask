import 'package:api_task/UI/ProductsScreen/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/ProductsVM/ProductsVM.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);
  static String routeName = "/ProductView";

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Products',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 33,  // Set the height to 33 pixels
              child: TextField(
                onChanged: (value) {
                  productViewModel.searchProducts(value); // Call search method on text change
                },
                decoration: InputDecoration(
                  labelText: 'Search Products',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8), // Adjust vertical padding to center text within the TextField
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:5,bottom: 5,left: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' ${productViewModel.products.length} results found', // This shows the count of products fetched
                style: GoogleFonts.poppins(fontSize: 10,color: Colors.grey),
              ),
            ),
          ),
          productViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : productViewModel.errorMessage.isNotEmpty
              ? Center(child: Text(productViewModel.errorMessage))
              : Expanded(
            child: ListView.builder(
              itemCount: productViewModel.products.length,
              itemBuilder: (context, index) {
                final product = productViewModel.products[index];
                return ProductCardWidget(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

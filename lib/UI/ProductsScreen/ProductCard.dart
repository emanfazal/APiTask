import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../Model/ProductsModel.dart';

class ProductCard extends StatelessWidget {
  final String apiUrl = 'https://api.example.com/products'; // Replace with your API URL

  Future<List<Products>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => Products.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error fetching products: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No products available.'));
        } else {
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCardWidget(product: products[index]);
            },
          );
        }
      },
    );
  }
}

class ProductCardWidget extends StatelessWidget {
  final Products product;

  const ProductCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.thumbnail ?? '',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 50);
                },
              ),
            ),
            const SizedBox(height: 12),
            // Product Title
            Row(
              children: [
                Text(
                  product.title ?? 'No title',
                  style: GoogleFonts.poppins(fontSize:14,color: Colors.black,fontWeight: FontWeight.bold)
                ),
                const Spacer(),
                // Price
                Text(
                  '\$${product.price != null ? product.price!.toStringAsFixed(2) : 'N/A'}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [

                Row(
                  children: [
                    // Loop through the rating and show the appropriate number of filled and empty stars
                    for (int i = 1; i <= 5; i++)
                      Icon(
                        i <= (product.rating ?? 0).floor()
                            ? Icons.star // Filled star
                            : i == (product.rating ?? 0).floor() + 1 && (product.rating! % 1 != 0)
                            ? Icons.star_half // Half star if the rating has a decimal part
                            : Icons.star_border, // Empty star
                        color: Colors.orange,
                        size: 16,
                      ),
                    const SizedBox(width: 4),
                    Text(
                      product.rating != null
                          ? product.rating!.toStringAsFixed(1)
                          : 'N/A',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),



              ],
            ),
            const SizedBox(height: 8),
            // Brand and Category
            Text(
              'By ${product.brand ?? 'Unknown'}',
              style: GoogleFonts.poppins(fontSize: 14,color: Colors.grey)
            ),
            SizedBox(height: 30,),
            Text(
              'In ${product.category ?? 'Uncategorized'}',
              style: GoogleFonts.poppins(fontSize: 14,color: Colors.black)
            ),
          ],
        ),
      ),
    );
  }
}

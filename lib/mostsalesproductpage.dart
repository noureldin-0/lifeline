import 'package:flutter/material.dart';

class MostSalesProductsPage extends StatelessWidget {
  const MostSalesProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for most sold products
    final List<Product> mostSoldProducts = [
      Product(name: 'Product 1', sales: 100),
      Product(name: 'Product 2', sales: 90),
      Product(name: 'Product 3', sales: 80),
      Product(name: 'Product 4', sales: 70),
      Product(name: 'Product 5', sales: 60),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Most Sales Products',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff078EB2),
      ),
      body: ListView.builder(
        itemCount: mostSoldProducts.length,
        itemBuilder: (context, index) {
          final product = mostSoldProducts[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Sales: ${product.sales}'),
            onTap: () {
              // Handle tapping on a product, e.g., navigate to product details page
            },
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final int sales;

  Product({required this.name, required this.sales});
}

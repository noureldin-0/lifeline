import 'package:flutter/material.dart';
import 'package:untitled/customercheckoutpage.dart';
import 'package:untitled/customerhomepage.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace this with actual data fetching logic
    final List<Product> cartItems = [
      Product(name: 'Product 1', price: 20.0),
      Product(name: 'Product 2', price: 30.0),
      Product(name: 'Product 3', price: 40.0),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff078EB2),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            // Add more details or actions if needed
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ElevatedButton(
            onPressed:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff078EB2), // Set the background color of the elevated button
            ),
            child: Text('Checkout',style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CustomerHomePage()),
          );
        },
        backgroundColor: Color(0xff078EB2), // Set the background color of the floating action button
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

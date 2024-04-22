import 'package:flutter/material.dart';
import 'package:untitled/pharmacyrequstorders.dart';
import 'package:untitled/store.dart'; // Import store data model

class PharmStorePage extends StatelessWidget {
  final List<Store> stores;

  const PharmStorePage({Key? key, required this.stores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff078EB2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(stores[index].name),
                  subtitle: Text(stores[index].address),
                  // Add more details if needed
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreCategoriesPage(
                          store: stores[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StoreCategoriesPage extends StatelessWidget {
  final Store store;

  const StoreCategoriesPage({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff078EB2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          store.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to shopping cart page
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Add product to wishlist
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // List of categories
          // Implement your categories UI here
          // Each category should navigate to the respective products page
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled/store.dart'; // Import store data model

class PharmRequestOrdersPage extends StatefulWidget {
  const PharmRequestOrdersPage({Key? key}) : super(key: key);

  @override
  _PharmRequestOrdersPageState createState() => _PharmRequestOrdersPageState();
}

class _PharmRequestOrdersPageState extends State<PharmRequestOrdersPage> {
  List<Store> stores = [
    Store(name: 'Store A', address: '123 Main St'),
    Store(name: 'Store B', address: '456 Elm St'),
    Store(name: 'Store C', address: '789 Oak St'),
    // Add more stores as needed
  ];

  List<Store> filteredStores = [];

  @override
  void initState() {
    filteredStores = stores;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff078EB2),
        title: Text(
          'Request Orders',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for stores or products...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                setState(() {
                  filteredStores = stores
                      .where((store) =>
                      store.name.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStores.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredStores[index].name),
                  subtitle: Text(filteredStores[index].address),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreDetailsPage(store: filteredStores[index]),
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

class Store {
  final String name;
  final String address;

  Store({required this.name, required this.address});
}

// import 'package:flutter/material.dart';
// import 'store.dart'; // Import store data model
class StoreDetailsPage extends StatelessWidget {
  final Store store;

  const StoreDetailsPage({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff078EB2),
        title: Text(
          store.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // Replace these placeholders with your actual categories
                _buildCategoryItem(context, 'Product 1'),
                _buildCategoryItem(context, 'Product 2'),
                _buildCategoryItem(context, 'Product 3'),
                _buildCategoryItem(context, 'Product 4'),
                // Add more categories as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String categoryName) {
    return ListTile(
      title: Text(categoryName),
      onTap: () {
        // Navigate to the products page for this category
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Add product to wishlist
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Add functionality to add product
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Add product to cart
            },
          ),
        ],
      ),
    );
  }
}

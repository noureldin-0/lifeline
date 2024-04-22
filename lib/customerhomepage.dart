import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/customer_myorders.dart';
import 'package:untitled/customercartpage.dart';
import 'package:untitled/customersettingspage.dart';
import 'package:untitled/customerwishlist.dart';
import 'package:untitled/first_page.dart';
import 'package:untitled/mostsalesproductpage.dart';
import 'package:untitled/nearest%20pharmacies%20page.dart';
import 'package:untitled/offerspage.dart';
// import 'package:untitled/pharmacy_search.dart'; // Import the necessary pages

class CustomerHomePage extends StatelessWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff078EB2),
        title: Text(
          'Customer Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            // Search Bar
            PharmacySearchBar(),
            SizedBox(height: 40),
            // Nearest Pharmacies
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => NearestPharmaciesPage()));
                // Navigate to nearest pharmacies page or perform related action
                print('Nearest Pharmacies pressed');
              },
              child: Column(
                children: [
                  Icon(Icons.location_on, color: Colors.blueAccent, size: 50),
                  Text('Nearest Pharmacies', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 60),
            // Most Sales Products
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => MostSalesProductsPage()));
                // Navigate to most sales products page or perform related action
                print('Most Sales Products pressed');
              },
              child: Column(
                children: [
                  Icon(Icons.shopping_bag, color: Colors.blueAccent, size: 50),
                  Text('Most Sales Products', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 60),
            // Offers
            GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder:
                  (context) => OffersPage()));
                // Navigate to offers page or perform related action
                print('Offers pressed');
              },
              child: Column(
                children: [
                  Icon(Icons.local_offer, color: Colors.blueAccent, size: 50),
                  Text('Offers', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: ProfileDrawer(), // Adding the ProfileDrawer to the drawer property of Scaffold
    );
  }

  void _showProfilePanel(BuildContext context) {
    Scaffold.of(context).openEndDrawer(); // Open the right-side drawer
  }
}

class PharmacySearchBar extends StatelessWidget {
  const PharmacySearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for pharmacies or products...',
          prefixIcon: Icon(Icons.search, color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff078EB2),
            ),
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('My Orders'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrdersPage()),
              );
            },
          ),
          ListTile(
            title: Text('My Wishlist'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWishlistPage()),
              );
            },
          ),
          ListTile(
            title: Text('My Cart'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCartPage()),
              );
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomerSettingsPage()),
            );
              // Navigate to Settings page
            },
          ),
        ],
      ),
    );
  }
}

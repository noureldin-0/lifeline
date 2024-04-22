import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for offers
    final List<String> offers = [
      'Offer 1: 10% off on all products',
      'Offer 2: Buy 1 Get 1 Free on selected items',
      'Offer 3: Free shipping on orders above \$50',
      // Add more offers as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Offers',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff078EB2),
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return ListTile(
            title: Text(offer),
            onTap: () {
              // Handle tapping on an offer if needed
            },
          );
        },
      ),
    );
  }
}

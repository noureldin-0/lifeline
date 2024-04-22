import 'package:flutter/material.dart';
import 'package:untitled/paharmacyproduct.dart';
import 'package:untitled/pharmacychoose.dart';
import 'package:untitled/pharmacyorders.dart';
import 'package:untitled/pharmacyprofile.dart';
import 'package:untitled/pharmacysettings.dart';
import 'package:untitled/store_orders.dart';
import 'package:untitled/store_product.dart';
import 'package:untitled/storeeditpage.dart';
import 'package:untitled/storesettings.dart';

class PharmHomePage extends StatelessWidget {
  const PharmHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff078EB2),
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          Image.asset(
            'assets/image/pharmacy.png',
            width: 150.0,
            height: 150.0,
          ),
          SizedBox(height: 20.0),
          Text(
            'Pharmacy Name',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.0),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(18.0),
              children: [
                _buildMenuItem(context, 'Profile Update', Icons.person, () {
                  // Navigate to profile update page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PharmProfilePage()));
                }),
                _buildMenuItem(context, 'Product Update', Icons.cloud_upload,
                        () {
                      // Navigate to product update page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PharmProducts()));
                    }),
                _buildMenuItem(
                    context, 'Orders', Icons.local_shipping, () {
                  // Navigate to orders page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PharmChoosePage()));
                }),
                _buildMenuItem(context, 'Settings', Icons.settings, () {
                  // Navigate to settings page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PharmSettings()));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.lightBlue,
      child: TextButton(
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48.0, color: Colors.white),
              SizedBox(height: 12.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

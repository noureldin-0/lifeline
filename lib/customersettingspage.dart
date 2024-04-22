import 'package:flutter/material.dart';
import 'package:untitled/customer_myorders.dart';
import 'package:untitled/customeraccount.dart';
import 'package:untitled/customercartpage.dart';
import 'package:untitled/customerwishlist.dart';
import 'package:untitled/first_page.dart';
import 'package:untitled/mostsalesproductpage.dart';
import 'package:untitled/nearest%20pharmacies%20page.dart';
import 'package:untitled/offerspage.dart';
import 'package:untitled/signin_page.dart';
// import 'package:untitled/pharmacy_search.dart'; // Import the necessary pages

class CustomerSettingsPage extends StatelessWidget {
  const CustomerSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff078EB2),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildSettingOption(context, 'Account', onTap: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomerAccountPage()),
          );
            // Perform action when Account is tapped

          }),
          _buildSettingOption(context, 'History', onTap: () {
            // Show confirmation dialog before clearing history
            _showHistoryClearConfirmationDialog(context);
          }),
          _buildSettingOption(context, 'Language', onTap: () {
            // Open language selection dialog
            _showLanguageSelectionDialog(context);
          }),
          _buildSettingOption(context, 'Logout', onTap: () {
            // Show confirmation dialog before logging out
            _showLogoutConfirmationDialog(context);
          }),
        ],
      ),
    );
  }

  Widget _buildSettingOption(BuildContext context, String title,
      {VoidCallback? onTap}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: Color(0xff078EB2), // Set the color of the card to blue
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18.0, color: Colors.white), // Set font color to white
        ),
        onTap: onTap,
      ),
    );
  }

  void _navigateToAccountPage(BuildContext context) {
    // Implement navigation to account page
    // For example:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AccountPage()),
    // );
  }

  void _showHistoryClearConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Clear History'),
        content: Text('Are you sure you want to clear your history?'),
        actions: [
          TextButton(
            onPressed: () {
              // Close the dialog and clear history
              Navigator.pop(context);
              _clearHistory(context);
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.pop(context);
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  void _clearHistory(BuildContext context) {
    // Implement clear history functionality
    // For example:
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => HistoryClearPage()),
    // );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Language'),
        content: Text('English'),
        actions: [
          TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              // Close the dialog and logout
              Navigator.pop(context);
              _logout(context);
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.pop(context);
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    // Implement logout functionality
    // For example:
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SigninPage()),
    );
  }
}

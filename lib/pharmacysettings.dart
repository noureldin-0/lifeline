import 'package:flutter/material.dart';
import 'package:untitled/pharmacyprofile.dart';
import 'package:untitled/signin_page.dart';
import 'package:untitled/storeeditpage.dart';
import 'package:untitled/storehomepage.dart';

class PharmSettings extends StatelessWidget {
  const PharmSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xff078EB2),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
            child: Icon(
              Icons.settings,
              size: 100.0,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 30.0),
          _buildSettingOption(
              Icons.account_circle, 'My Account', () => _navigateToMyAccount(context)),
          _buildSettingOption(Icons.location_on, 'Location Update',
                  () => _handleLocationUpdate(context)),
          _buildSettingOption(
              Icons.history, 'Clear History', () => _confirmClearHistory(context)),
          _buildSettingOption(Icons.logout, 'Log Out', () => _confirmLogout(context)),
        ],
      ),
    );
  }

  Widget _buildSettingOption(
      IconData icon, String title, VoidCallback onTapCallback) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40.0, color: Colors.black),
            SizedBox(width: 20.0),
            Text(
              title,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToMyAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PharmProfilePage()),
    );
  }

  void _handleLocationUpdate(BuildContext context) {
    // Navigate to the screen where the location can be updated using Google Maps
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PharmProfilePage()),
    );
  }

  void _confirmClearHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Clear History"),
          content: Text("Are you sure you want to clear your history?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                _clearHistory(context);
                Navigator.of(context).pop();
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Log Out"),
          content: Text("Are you sure you want to log out?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage()));
              }, // <- Add semicolon here
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }


  void _clearHistory(BuildContext context) {
    // Implement Clear History action
    print("Clearing history...");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("History cleared."),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Implement Log Out action
    print("Logging out...");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SigninPage()),
    );
  }
}

// You can use the controller to interact with the map
// For example, to set the map's boundaries or listen for user interactions


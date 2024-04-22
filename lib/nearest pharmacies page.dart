import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Import geolocator package for getting user location

class NearestPharmaciesPage extends StatefulWidget {
  const NearestPharmaciesPage({Key? key}) : super(key: key);

  @override
  _NearestPharmaciesPageState createState() => _NearestPharmaciesPageState();
}

class _NearestPharmaciesPageState extends State<NearestPharmaciesPage> {
  List<String> pharmacies = []; // Placeholder for nearby pharmacies

  @override
  void initState() {
    super.initState();
    _fetchNearbyPharmacies();
  }

  Future<void> _fetchNearbyPharmacies() async {
    // Get user's current location
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // In a real app, you would query a database or service based on the user's location
    // Here, we just add some dummy data for demonstration purposes
    setState(() {
      pharmacies = ['Pharmacy A', 'Pharmacy B', 'Pharmacy C'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearest Pharmacies'),
      ),
      body: ListView.builder(
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pharmacies[index]),
          );
        },
      ),
    );
  }
}

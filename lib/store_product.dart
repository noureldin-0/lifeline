import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class StoreProduct extends StatelessWidget {
  const StoreProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Update',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff078EB2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Product Category:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              items: <String>[
                'Medicines',
                'Medical Tools',
                'Medical Equipment',
                'Health Supplements'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  // Navigate to the selected category page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(category: newValue),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Drop Files Here to Add Products:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                _openFilePicker(context);
              },
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.cloud_upload,
                    size: 50.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openFilePicker(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // File picked successfully, do something with it
        String? filePath = result.files.single.path;
        // Process the file further (e.g., upload it, read its content)
        print('File picked: $filePath');
      } else {
        // User canceled the file picker
        print('User canceled file picking');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }
}

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff078EB2),
        title: Text(category,style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.bold
        ),
        ),
      ),

      body: Center(
        child: Text('Products under $category category',),
      ),

    );
  }
}

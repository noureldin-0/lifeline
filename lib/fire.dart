import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Myfire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firestore Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Add data to Firestore
                  FirebaseFirestore.instance.collection('test').add({
                    'message': 'Hello Firestore!',
                  });
                },
                child: Text('Add Data'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Retrieve data from Firestore
                  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('test').get();
                  snapshot.docs.forEach((doc) {
                    print(doc['message']);
                  });
                },
                child: Text('Retrieve Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

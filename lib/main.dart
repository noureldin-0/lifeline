import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/choosepage.dart';
import 'package:untitled/customerwishlist.dart';
import 'package:untitled/first_page.dart';
import 'package:untitled/forgetpassword_page.dart';
import 'package:untitled/newpass_page.dart';
import 'package:untitled/pharmacychoose.dart';
import 'package:untitled/second_page.dart';
import 'package:untitled/signin_page.dart';
import 'package:untitled/store_orders.dart';
import 'package:untitled/store_product.dart';
import 'package:untitled/storeeditpage.dart';
import 'package:untitled/storehomepage.dart';
import 'package:untitled/storesettings.dart';
import 'package:untitled/third_page.dart';
import 'package:untitled/verification_page.dart';
import './firestore/FirestoreService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './fire.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),



    );
  }


}











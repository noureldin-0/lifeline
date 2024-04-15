
  import 'package:flutter/material.dart';
  import 'package:flutter/widgets.dart';
import 'package:untitled/second_page.dart';
  import 'package:untitled/signin_page.dart';
import 'package:untitled/storeeditpage.dart';
import 'package:untitled/storehomepage.dart';
import 'package:untitled/third_page.dart';

  class Choosepage extends StatelessWidget {
    const Choosepage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff078EB2), Color(0xff0E4161)],
              stops: [0.4, 0.6],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: (
          Column(
            children: [
              SizedBox(
                height: 30,
              ),

              Row(
                children: [
                  IconButton(onPressed:(){
                    Navigator.pop(context);
                  }, icon: BackButtonIcon()),
                ],
              ),
              SizedBox(height: 70,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreHomePage()));
              },
                  child: Image.asset('assets/image/store.png',)),
              Text('Store',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
              color: Colors.white),),
              SizedBox(
                height: 30,
              ),
              GestureDetector(onTap:(){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StoreEditPage()));
              },
              child: Image.asset('assets/image/pharmacy.png'),),
              Text('Pharmacy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
              color: Colors.white),),
              SizedBox(
                height: 30,
              ),
              GestureDetector(onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SigninPage()));
              },
              child: Image.asset('assets/image/user.png'),),
              Text('Customer',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
              ),),

            ],
          )
          ),
        ),
      );
    }
  }

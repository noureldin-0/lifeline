import 'package:flutter/material.dart';
import 'package:untitled/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    _navigateToLogin();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(milliseconds: 1300));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                const Text(
                  'HELLO!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/image/my_logo.png'),
                ),
                SizedBox(
                  height: 500,
                  width: 500,
                  child: Image.asset('assets/image/home.png'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


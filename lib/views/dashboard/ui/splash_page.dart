import 'dart:async';
import 'package:fairShop/views/authorization/ui/login.dart';
import 'package:fairShop/features/home/ui/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    super.initState();
    whreToGo();
    // Navigate to the home screen after the splash screen animation finishes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/images/fairshoplogo.png',width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/3,),
        const SizedBox(height: 14),
        const CircularProgressIndicator(
          color: Colors.white,
        )
      ]),
    );
  }

  void whreToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLogin = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 3), () {
      if (isLogin != null) {
        if (isLogin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }
}

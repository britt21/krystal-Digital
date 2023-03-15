import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:krystal_digital/home/home.dart';
import 'package:krystal_digital/login/login.dart';

import '../utils/theme.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), (){
      Get.off(() => HomeScreen(),transition: Transition.fade);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitDualRing(
          color: appPurple, // Set the color of the loading spinner to purple
          size: 100.0, // Set the size of the loading spinner
    ),
          SizedBox(height: 20,),
          Text("KRYSTAL DIGITAL",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold  ),)
        ],
      )
    )
    );

  }
}
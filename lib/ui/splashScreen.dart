import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDownTime();
  }

  countDownTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Timer(Duration(seconds: splashDuration), () {
      final token = prefs.getString('token');
      var path = '/login';
      if (token.isNotEmpty) {
        path = '/home';
      }
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      Navigator.pushNamed(context, path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Image.asset('images/splash.jpg', fit: BoxFit.cover,),
    );
  }
}

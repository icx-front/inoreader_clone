import 'package:flutter/material.dart';
import 'dart:async';
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
    print('count down time');
    return Timer(Duration(seconds: splashDuration), () {
      // force hide the keyboard
//      SystemChannels.textInput.invokeMethod('TextInput.hide');
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('Splash'),
    );
  }
}

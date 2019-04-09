import 'package:flutter/material.dart';
import 'ui/splashScreen.dart';
import 'ui/loginScreen.dart';
import 'ui/homeScreen.dart';
import 'ui/feedScreen.dart';
import 'ui/showPageDetail.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    routes: {
      // When we navigate to the "/" route, build the FirstScreen Widget
      '/': (context) => SplashScreen(),
      // When we navigate to the "/second" route, build the SecondScreen Widget
      '/login': (context) => LoginScreen(),
      '/home': (context) => HomeScreen(),
      '/feed': (context) => FeedScreen(),
      '/detail': (context) => PageDetailScreen(),
    },
  ));
}

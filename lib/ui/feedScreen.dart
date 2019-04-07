import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Home'),
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}

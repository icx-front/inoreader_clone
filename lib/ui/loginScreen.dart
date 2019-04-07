import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'package:inoreader_clone_icx/common/apiFunctions/requestLoginApi.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwdController = TextEditingController();

  // async func to launch url
  Future launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      print('Unable to reach $url');
    }
  }

  void login() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    var email = _emailController.text;
    var passwd = _passwdController.text;
    var result = await requestLoginApi(context, email, passwd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Text('logon'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: Text('Email'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: '请输入邮箱',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: Text('Password'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: TextField(
              controller: _passwdController,
              decoration: InputDecoration(
                hintText: '输入密码',
              ),
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: Container(
              child: RaisedButton(
                onPressed: login,
                child: Text('登陆', style: TextStyle(color: Colors.white)),
                color: Colors.blue[500],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'package:inoreader_clone_icx/common/apiFunctions/requestLoginApi.dart';
import 'package:inoreader_clone_icx/common/util/showDialog.dart';
import 'package:inoreader_clone_icx/ui/authLoginScreen.dart';
import 'package:inoreader_clone_icx/common/localServer/RedirectWidget.dart';

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

    if ((result.email).isEmpty) {
      showCustomDialog();
    }
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/logo.jpg',
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 8, 0, 2),
            child: Text(
              'Email',
              style: TextStyle(fontSize: 16),
            ),
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
            padding: EdgeInsets.fromLTRB(10, 8, 0, 2),
            child: Text(
              'Password',
              style: TextStyle(fontSize: 16),
            ),
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
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            child: Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
                height: 45,
                width: double.infinity,
                child: FlatButton(
                  onPressed: login,
                  child: Text('登陆',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  color: Colors.blue[500],
                ),
              ),
            ),
          ),
          InkWell(
            child: Text('Inoreader'),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) =>
//                          AuthLoginScreen(uri: 'https://www.baidu.com')));
//            },
            onTap: getToken,
          )
        ],
      ),
    );
  }
}

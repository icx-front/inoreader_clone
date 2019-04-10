import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:inoreader_clone_icx/model/json/loginModel.dart';

Map<String, dynamic> result = {};

Future<LoginModel> requestLoginApi(
    BuildContext context, String email, String password) async {
  final url = 'https://www.inoreader.com/accounts/ClientLogin';

  result['email'] = email;

  // 类型 变量名 值
  Map<String, String> body = {
    'Email': email,
    'Passwd': password,
  };

//  nqSy4uGa8c4V9CL

  final response = await http.post(url, body: body);

  print(response.statusCode);

  if (response.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var body = response.body;
    if (body is String) {
      body.split(' ').map((item) {
        var _item = item.split('=');
        result['token'] = _item[_item.length - 1];
      }).toList();

      await prefs.setString('token', result['token']);
      await prefs.setString('email', result['email']);
    }
    Navigator.pushNamed(context, '/feed');
    return LoginModel(email, result['token'], 0);
  } else {
    return null;
  }
}

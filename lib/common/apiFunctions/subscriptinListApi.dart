import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:inoreader_clone_icx/model/json/subscriptionModel.dart';

Future getSubscriptionList(BuildContext context) async {
  final url = 'https://www.inoreader.com/reader/api/0/subscription/list';
  final id = '1000000108';
  final key = '2sRrt5Eax4Po2BghXSt2XkYz89aG6TjQ';

  final prefs = await SharedPreferences.getInstance();
//  var token = prefs.getString('token');

//  var basicAuth = 'GoogleLogin auth=$token';

  var basicAuth = 'GoogleLogin auth=alZ08OWd9QHoiH6SurNwgomn1_ICyclb';

  // prepare post body
  Map<String, dynamic> body = {
    'AppId': id,
    'AppKey': key,
  };

  Map<String, String> headers = {
    'Authorization': basicAuth,
  };

  // request for resources body/headers should be Map<String, String>
  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    Iterable subscriptions = responseJson['subscriptions'];
//    var list = SubscriptionModel.fromJson(responseJson);
    var list = subscriptions
        .map((dynamic model) => SubscriptionModel.fromJson(model))
        .toList();

    return list;
  } else if (response.statusCode == 401) {
    // auth fail
    Navigator.pushNamed(context, '/login');
  } else {
    return null;
  }
}

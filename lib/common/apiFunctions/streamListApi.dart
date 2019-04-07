import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inoreader_clone_icx/model/json/feedItemModel.dart';
import 'package:inoreader_clone_icx/constant/constants.dart';

// 返回stream feed model
Future getStreamFeeds(BuildContext context) async {
  var url = Uri(
    scheme: 'https',
    host: 'www.inoreader.com',
    path: '/reader/api/0/stream/contents',
    queryParameters: {'AppId': ID, 'AppKey': KEY},
  );

  var basicAuth = 'GoogleLogin auth=alZ08OWd9QHoiH6SurNwgomn1_ICyclb';

  Map<String, String> headers = {
    'Authorization': basicAuth,
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    Iterable feedList = responseJson['items'];

    var list = feedList.map((item) {
      return FeedModel.fromJson(item);
    }).toList();

    return list;
  } else {
    return null;
  }
}

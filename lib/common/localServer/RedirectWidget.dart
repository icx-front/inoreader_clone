import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:inoreader_clone_icx/model/json/tokenModel.dart';
import 'package:inoreader_clone_icx/constant/constants.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

Future<Stream<String>> _server() async {
  final StreamController<String> onCode = StreamController();
  HttpServer server =
      await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  server.listen((HttpRequest request) async {
    final String code = request.uri.queryParameters['code'];
    request.response
      ..statusCode = 200
      ..headers.set('Content-type', ContentType.HTML.mimeType)
      ..write("<html><h1>You can now close this window</h1></html>");

    await request.response.close();
    await server.close(force: true);
    onCode.add(code);
    await onCode.close();
  });
  return onCode.stream;
}

Future<Token> getToken() async {
  Stream<String> onCode = await _server();

  _launchURL(AUTH_URL);

  // get code from auth
  final String code = await onCode.first;

  // prepare post data and headers
  Map<String, dynamic> body = {
    'code': code,
    'client_id': ID,
    'client_secret': KEY,
    'scope': SCOPE_R,
    'redirect_uri': 'http://localhost:8080',
    'grant_type': 'authorization_code',
  };
  Map<String, String> header = {
    'Content-type': 'application/x-www-form-urlencoded',
  };

  // post data to exchange token
  try {
    final response = await http.post(TOKEN_URL, headers: header, body: body);
    print(response.body);
    return Token.fromMap(json.decode(response.body));
  } catch (e) {
    print(e);
  } finally {
    closeWebView();
  }
  return null;
}

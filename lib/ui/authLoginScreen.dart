import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:inoreader_clone_icx/constant/constants.dart';

class AuthLoginScreen extends StatelessWidget {
  final String uri;

  final String baseUri = 'https://www.inoreader.com/oauth2/auth?client_id=$ID&redirect_uri=https://www.baidu.com&response_type=code&state=xxxx';

  AuthLoginScreen({Key key, @required this.uri}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebView(
      initialUrl: baseUri,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

}
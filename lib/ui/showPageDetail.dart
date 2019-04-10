import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageDetailScreen extends StatefulWidget {
  final String summary;

  PageDetailScreen({Key key, @required this.summary}) : super(key: key);

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetailScreen> {
  String summary;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    summary = '''<!DOCTYPE html>
                        <html lang="en">
                        <head>
                          <meta charset="UTF-8">
                          <title>Document</title>
                        </head>
                        <body>
                          ${widget.summary}
                        </body>
                        </html>''';
  }

  // show content f
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页'),
      ),
      body: WebView(
//        initialUrl: 'https://main.icarbonx.com/surveys/226',
        initialUrl:
            Uri.dataFromString(summary, mimeType: 'text/html').toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

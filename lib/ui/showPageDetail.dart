import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageDetailScreen extends StatefulWidget {
  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetailScreen> {
  // show content f
  var content = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页'),
      ),
      body: WebView(
//        initialUrl: 'https://main.icarbonx.com/surveys/226',
        initialUrl: Uri.dataFromString(
                '<p style="color: red;">xxxfafjdkaslfjkalsjfklsajfklsdjfklsj</p>',
                mimeType: 'text/html')
            .toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

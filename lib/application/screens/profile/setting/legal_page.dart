import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LegalPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: 'https://kongdee502783474.wordpress.com/blog/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  final String url, title;
  // ignore: use_key_in_widget_constructors
  const WebViewExample({required this.url, required this.title});
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: WebView(
            initialUrl: widget.url,
          ),
        ));
  }
}

import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import 'dart:io';

 import 'package:webview_flutter/webview_flutter.dart';

 class WebViewExample extends StatefulWidget {
  final String url, title;
  WebViewExample({required this.url, required this.title});
   @override
   WebViewExampleState createState() => WebViewExampleState();
 }

 class WebViewExampleState extends State<WebViewExample> {
   @override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: kPrimaryColor, // status bar color
    ));
   }

   @override
   Widget build(BuildContext context) {
     return

     Scaffold(
       appBar: AppBar(
         centerTitle: true,
         backgroundColor: kPrimaryColor,
         title:  Text(widget.title),
       ),
       body:  SafeArea(
         child: WebView(
         initialUrl: widget.url,
            ),
       ));
     
     
     
     
     
     
   }
 }
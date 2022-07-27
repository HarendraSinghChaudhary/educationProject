import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intercom_flutter/intercom_flutter.dart';



class IntercomScreen extends StatefulWidget {
  @override
  State<IntercomScreen> createState() => _IntercomScreenState();
}

class _IntercomScreenState extends State<IntercomScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: kPrimaryColor, // status bar color
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text('Contact Us'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              // Intercom.instance.displayMessenger();
            },
            child: Text('Show messenger'),
          ),
        ),
      );
  }
}
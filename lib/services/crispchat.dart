import 'package:Ambitious/main.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:crisp/crisp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/sharedPreference.dart';



class CrispChat extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CrispChat> {
  late CrispMain crispMain;

  String i = "";

  @override
  void initState() {
    super.initState();
    getUserList();
       SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: kPrimaryColor, // status bar color
    ));

    crispMain = CrispMain(
      websiteId: '99031843-7243-44af-9185-0a13f0d18334',
      locale: 'en-us',
    );

    crispMain.register(
      user: CrispUser(
        email: email.toString(),
        avatar: '',
        nickname: name.toString(),
      
        phone: "",
      ),
      
    );

    // crispMain.setMessage("");

    // crispMain.setSessionData({
    //   "order_id": "111",
    //   "app_version": "0.1.1",
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text('Welcome to Ambitious'),
        ),
        body: CrispView(
          crispMain: crispMain,
          clearCache: false,
        ),
      );
  }

   Future<dynamic> getUserList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id").toString();
    print("id: " + id.toString());
    email = pref.getString("email").toString();
    print("email: " + email.toString());
    name = pref.getString("name").toString();
    print("name: " + name.toString());
  if(Preferences.pref!.getString("name").toString()=="null"){
    name = (Preferences.pref!.getString("firstname")??"")+" "+(Preferences.pref!.getString("lastname")??"");
    print(name);

    }

    setState(() {});
  }


  
}
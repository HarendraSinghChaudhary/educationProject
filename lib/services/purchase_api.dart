

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:purchases_flutter/models/offering_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class MyOfferings {
  static const id_product1 = "six_month_access";

  static const allIds = [id_product1];
}

class PurchaseApi {
  //static const _apiKey = 'goog_IQEavWdyZNEDlbHfqvBpKJSKXMl';
    static const _apiKey = 'appl_zxNBaoTfOXJyufiXfNnBDAHvVSl';
  static Future init() async {
    await Purchases.setDebugLogsEnabled(true);
  //  await Purchases.setup(_apiKey); //old
   
    //PurchasesConfiguration(_apiKey);
    // Purchases.logIn(HelperFoos.userId);
    // Purchases.logOut();
  }

  static Future<List<Offering>> fetchOffers({bool all = true}) async {
    try {
      final offerings = await Purchases.getOfferings();
      print(
          "\n================ inside fetchOffers ================\n${offerings.all.values.toList().first.identifier}\n================ inside fetchOffers ================");
      if (!all) {
        final current = offerings.current;
        return current == null ? [] : [current];
      } else {
        //print("inside fetchOffers Elseeeeeeeeeee");
        return offerings.all.values.toList();
      }
    } on Exception catch (e) {
      //print("inside fetchOffers Errod: $e");
      return [];
    }
  }

  static Future<List<Offering>> fetchOffersByIds(List<String> ids) async {
    final offers = await fetchOffers();
    return offers.where((offer) => ids.contains(offer.identifier)).toList();
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      return true;
    } on Exception catch (e) {
      Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: "Purchase failed. Error: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(117, 5, 5, 5),
        textColor: Colors.white,
        fontSize: 16.0);
        
    
      return false;
    }
  }
}

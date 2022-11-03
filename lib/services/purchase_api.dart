import 'package:purchases_flutter/purchases_flutter.dart';

class MyOfferings {
  static const revnueCatSubscriptionsParentID = "Ambitious Subscriptions";
  static const allIds = [revnueCatSubscriptionsParentID];
}

class PurchaseApi {
  static Future init() async {
    await Purchases.setDebugLogsEnabled(false);
    // Purchases.logIn(HelperFoos.userId);
    // Purchases.logOut();
  }

  static Future<List<Offering>> fetchOffers({bool all = true}) async {
    try {
      final offerings = await Purchases.getOfferings();
      // print(
      //     "\n================ inside fetchOffers ================\n${offerings.all.values.toList().first}\n================ inside fetchOffers ================");
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
    //print(offers.first);
    return offers.where((offer) => ids.contains(offer.identifier)).toList();
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      return true;
    } on Exception catch (e) {
      //Report Error
      return false;
    }
  }
}

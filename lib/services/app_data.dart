import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class AppData {
  static bool isPro = false;
  static String currentActiveSubscription = 'null';

  static checkUserPurchaseStatus() async {
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();

      if (customerInfo.entitlements.all.isNotEmpty) {
        if (customerInfo.entitlements.all['pro']!.isActive) {
          AppData.isPro = true;
          currentActiveSubscription = 'annual';
        } else if (customerInfo.entitlements.all['promonthly']!.isActive) {
          AppData.isPro = true;
          currentActiveSubscription = 'monthly';
        }
      } else {
        AppData.isPro = false;
        currentActiveSubscription = 'null';
      }

    } on PlatformException catch (e) {
      AppData.isPro = false;
    }
  }
}

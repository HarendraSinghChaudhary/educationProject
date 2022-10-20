import 'package:flutter/services.dart';
import 'package:purchases_flutter/object_wrappers.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class AppData {
  static bool isPro = false;

  static checkUserPurchaseStatus() async {
    try {
      CustomerInfo restoredInfo = await Purchases.getCustomerInfo();

      AppData.isPro = restoredInfo.entitlements.all['pro']!.isActive;

      if (AppData.isPro) {
        print("====Pro");
      } else {
        print("===NotPro");
      }

      // ... check restored purchaserInfo to see if entitlement is now active
    } on PlatformException catch (e) {
      // Error restoring purchases
      AppData.isPro = false;
    }
  }
}

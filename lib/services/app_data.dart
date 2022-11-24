import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class AppData {
  static int pointsEarned = -1;
  static int weeklyStreak = -1;
  static int dailyStreak = -1;

  static bool isPro = false;
  static String currentActiveSubscription = 'null';

  static Future<void> checkUserPurchaseStatus() async {
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();

      if (customerInfo.entitlements.all.isNotEmpty) {
        if (customerInfo.entitlements.all['pro']!.isActive) {
          AppData.isPro = true;
          AppData.currentActiveSubscription = 'annual';
        } else if (customerInfo.entitlements.all['promonthly']!.isActive) {
          AppData.isPro = true;
          AppData.currentActiveSubscription = 'monthly';
        }
      } else {
        AppData.isPro = false;
        AppData.currentActiveSubscription = 'null';
      }
    } on PlatformException catch (e) {
      AppData.isPro = false;
    }
  }
}

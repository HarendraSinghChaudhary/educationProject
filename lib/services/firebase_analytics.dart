import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';

class MyFirebaseAnalytics {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static Future<void> appInstanceId() async {
    String? id = await analytics.appInstanceId;
    if (id != null) {
      log('appInstanceId succeeded: $id');
    } else {
      log('appInstanceId failed, consent declined');
    }
  }

  static Future<void> setAnalyticsCollectionEnabled() async {
    await analytics.setAnalyticsCollectionEnabled(true);
  }


  static Future<void> setSessionTimeoutDuration() async {
    await analytics.setSessionTimeoutDuration(const Duration(minutes: 5));
  }

  static Future<void> setUserId(String userId) async {
    await analytics.setUserId(id: userId);
  }

  static Future<void> setUserProperty(
      String propertyName, String propertyValue) async {
    await analytics.setUserProperty(name: propertyName, value: propertyValue);
  }

  static Future<void> setCurrentScreen(String screenName) async {
    await analytics.setCurrentScreen(
      screenName: screenName,
    );
  }

  
}

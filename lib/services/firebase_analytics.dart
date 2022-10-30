import 'package:firebase_analytics/firebase_analytics.dart';
class MyFirebaseAnalytics{

 static Future<void> setAnalyticsCollectionEnabled() async {
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  }

 static Future<void> setUserId(String userId) async {
    await FirebaseAnalytics.instance.setUserId(id: userId);
  }

static  Future<void> setUserProperty(String userName, String userRole) async {
    await FirebaseAnalytics.instance.setUserProperty(name: userName, value: userRole);
  }

 static Future<void> setCurrentScreen(String screenName) async {
    await FirebaseAnalytics.instance.setCurrentScreen(
      screenName: screenName,
    );
  }
}

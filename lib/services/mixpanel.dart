import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class Mixpanell {
  static Mixpanel? mixpanel;
}

Future getInstance() async {
  Mixpanell.mixpanel = await Mixpanel.init(
    "d0b9a45e61612a70e7a3f6bb8396a918",
    optOutTrackingDefault: false,
    // trackAutomaticEvents: false,
  ); // production mixpanel token
}

// TODO rename this to mixpanelIdentify
Future mixPanelStart(String id, String _name, String _email) async {
  String distinctID = id; //await Mixpanell.mixpanel!.getDistinctId();
  Mixpanell.mixpanel!.identify(
    distinctID,
  );
}

// TODO rename to mixpanelTrack
Future mixpanelTracking(String eventname,
  [Map<String, dynamic> properties = const {}]) 
  async {
  Mixpanell.mixpanel!.track(
    eventname,
    properties: properties,
  );
  await Mixpanell.mixpanel!.flush();
}

Future mixpanelLogout() async {
  Mixpanell.mixpanel!.reset();
}

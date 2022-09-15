// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:timezone/timezone.dart';
// // As an example, our default timezone is UTC.
// Location _currentLocation = getLocation('Etc/UTC');

// Future setCurentLocation() async {
//   String timezone = 'Etc/UTC';
//   try {
//     timezone = await FlutterNativeTimezone.getLocalTimezone();
//   } catch (e) {
//     print('Could not get the local timezone');
//   }
//   _currentLocation = getLocation(timezone);
//   setLocalLocation(_currentLocation);
// }
// event.start  (){

//   TZDateTime.from(oldDateTime, _currentLocation);
// }
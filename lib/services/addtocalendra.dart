
import 'package:add_2_calendar/add_2_calendar.dart';



  Future addtoCalendar(DateTime startdate, DateTime endDate, String title, String des,)async{

    String joinUrl = "Tap to join:\n$des";

final Event event = Event(
      title: title,
      description: joinUrl,
      // location: 'Event location',
      startDate: startdate,
      endDate: endDate,
      allDay: true,
    );

  Add2Calendar.addEvent2Cal(event);
  }
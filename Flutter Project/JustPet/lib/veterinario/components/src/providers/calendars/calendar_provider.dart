import 'package:justpet/veterinario/components/flutter_event_calendar.dart';
import 'package:justpet/veterinario/components/src/utils/calendar_types.dart';

abstract class CalendarProvider {
  bool isRTL();

  Map getMonthDays(WeekDayStringTypes type,int index);

  Map getMonthDaysShort(int index);

  CalendarDateTime getNextMonthDateTime();

  CalendarDateTime getPreviousMonthDateTime();

  CalendarDateTime getNextDayDateTime();

  CalendarDateTime getPreviousDayDateTime();

  CalendarDateTime getDateTime();

  String getFormattedDate({DateTime? customDate});

  CalendarDateTime goToMonth(index);

  CalendarDateTime goToDay(index);

  CalendarDateTime goToYear(int index);

  int getDateTimePart(PartFormat format);

  List<int> getYears();

  CalendarType getCalendarType();
}

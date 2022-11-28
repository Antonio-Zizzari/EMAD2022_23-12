import 'package:flutter/material.dart';
import 'package:justpet/veterinarian/components/src/models/event.dart';
import 'package:justpet/veterinarian/components/src/models/style/event_options.dart';

class EventCard extends StatelessWidget {
  Event fullCalendarEvent;

  EventCard({required this.fullCalendarEvent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        fullCalendarEvent.onTap?.call(fullCalendarEvent.listIndex);
      }),
      onLongPress: (() {
        fullCalendarEvent.onLongPress?.call(fullCalendarEvent.listIndex);
      }),
      child: fullCalendarEvent.child,
    );
  }
}

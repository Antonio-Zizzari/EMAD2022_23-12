import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:justpet/customer/models/pet_class.dart';
import 'package:justpet/veterinarian/components/flutter_event_calendar.dart';
import 'package:justpet/veterinarian/models/event_class.dart';

import 'package:justpet/veterinarian/screens/veterinarian_date.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../global/components/SideMenu.dart';
import '../../global/components/appbar.dart';



class TurniLavoro extends StatefulWidget {
  @override
  State<TurniLavoro> createState() => _TurniLavoroState();
}

class _TurniLavoroState extends State<TurniLavoro> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late final ValueNotifier<List<dynamic>> _selectedEvents;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("it_IT", null).then((_) {});
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey),
      drawer: SideMenu(),
      body: Column(
        children: [
          TableCalendar(
            locale: 'it_IT',
            startingDayOfWeek: StartingDayOfWeek.monday,
            firstDay: DateTime.utc(2022, 10, 16),
            lastDay: DateTime.now().add(
              Duration(days: 14),
            ),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                print(DateTime.now().hour);
                print(DateTime.now().minute);
                print(DateTime.now().second);
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
              _selectedEvents.value = _getEventsForDay(selectedDay);
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            eventLoader: (day){
              return kEvents[day] ?? [];
            },
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<dynamic>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ));

      /*listaEventi.map((evento) =>
          Event(
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              width: 45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(evento.orario_inizio, style: TextStyle(color: Color(0xff212121),fontSize: 18, ),),
                                  Text(evento.durata, style: TextStyle(color: Color(0xff666666),fontSize: 13),),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              width: 20,
                              color: Colors.black,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(evento.nome_cliente, style: TextStyle(
                                    color: Color(0xff212121),
                                    fontSize: 17
                                ),
                                ),
                                SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Icon(Icons.pets,size: 18,),
                                    SizedBox(width: 3,),
                                    Text(evento.razza_animale,style: TextStyle(color: Color(0xff666666)))
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(evento.tipoOperazione == TipoOperazione.operazione ? 'Operazione' : 'Visita',
                                    style: TextStyle(color: Colors.green,)),

                              ],
                            ),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VeterinarianDate(data: pets[0], visita: evento),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.arrow_circle_right_rounded),
                                    color: Colors.redAccent,),
                                )),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                ),
              ),
            ),
            dateTime: CalendarDateTime(
              year: evento.anno,
              month: evento.mese,
              day: evento.giorno,
              calendarType: CalendarType.GREGORIAN,
            ),
          )
        ).toList(),

      ),
    );*/
  }
}

final kEvents = LinkedHashMap<DateTime, List<dynamic>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventoSource);


List<dynamic> _getEventsForDay(DateTime day) {
  // Implementation example
  return kEvents[day] ?? [];
}


class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

final _kEventoSource = Map.fromIterable(listaEventi,
    key: (item) => DateTime.utc(int.parse(item.anno), int.parse(item.mese), int.parse(item.giorno), int.parse(item.ora), int.parse(item.minuto)),
    value: (item) => listaEventi);

/*final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });*/

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);




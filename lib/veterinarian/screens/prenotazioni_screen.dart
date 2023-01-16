import 'dart:collection';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:justpet/customer/models/Veterinario.dart';
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
  late List<bool> expanded;
  late List<double> height;


  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("it_IT", null).then((_) {});
    // than having to individually change instances of widgets.
    return FutureBuilder(
      future: _getAllEvents(),
      initialData: List.filled(0, evento, growable: true),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> eventi){
        _selectedDay = _focusedDay;
        ValueNotifier<List<dynamic>> _selectedEvents = ValueNotifier(eventi.data!.where((element) => element.anno+element.mese+element.giorno == _selectedDay.year.toString()+_selectedDay.month.toString()+_selectedDay.day.toString()).toList());
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
                VoidCallback function= (){
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                };
                _selectedEvents.value = eventi.data!;
                _selectedEvents.value.sort((a,b) => int.parse(a.ora).compareTo(int.parse(b.ora)) | int.parse(a.minuto).compareTo(int.parse(b.minuto)));
                function();
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              eventLoader: (day){
                // print("-------------------------");
                // print(day.year.toString()+day.month.toString()+day.day.toString());
                // print(kEvents[day.year.toString()+day.month.toString()+day.day.toString()]);
                //return kEvents[day.year.toString()+day.month.toString()+day.day.toString()] ?? [];
                return eventi.data!.where((element) => element.anno+element.mese+element.giorno == day.year.toString()+day.month.toString()+day.day.toString()).toList();
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
                      return Center(
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
                                            Text(value[index].ora+":"+value[index].minuto, style: TextStyle(color: Color(0xff212121),fontSize: 18, ),),
                                            Text(value[index].durata, style: TextStyle(color: Color(0xff666666),fontSize: 13),),
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
                                          Text(value[index].nome_cliente, style: TextStyle(
                                              color: Color(0xff212121),
                                              fontSize: 17
                                          ),
                                          ),
                                          SizedBox(height: 3,),
                                          Row(
                                            children: [
                                              Icon(Icons.pets,size: 18,),
                                              SizedBox(width: 3,),
                                              Text(value[index].razza_animale,style: TextStyle(color: Color(0xff666666)))
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text(value[index].tipoOperazione,
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
                                                    builder: (context) => VeterinarianDate(visita: value[index]),
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
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));}
    );
  }
}

final kEvents = LinkedHashMap<String, List<dynamic>>(

);



Future<List<dynamic>> _getEventsForDay(DateTime day, VoidCallback function) async{
  await getEventi(day).then((value) => {kEvents..addAll(value), function()});
  return kEvents[day.year.toString()+day.month.toString()+day.day.toString()] ?? [];
}

Future<List<dynamic>> _getAllEvents() async{
  final user = FirebaseAuth.instance.currentUser!;
  final eventi = await getAllEventiFromFirestore(user.email!, false);
  return eventi;
}


class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

Future<Map<String, List<dynamic>>> getEventi(DateTime day) async{
  final user = FirebaseAuth.instance.currentUser!;
  final eventi = await getAllEventiFromFirestore("dottalicegialli@gmail.com", false);
  print(day.year.toString()+day.month.toString()+day.day.toString());
  for(Evento ev in eventi){
    print(ev.anno+ev.mese+ev.giorno);
  }
  return Map.fromIterable(eventi,
      key: (item) => item.anno+item.mese+item.giorno,
      value: (item) => eventi.where((element) => element.anno+element.mese+element.giorno == day.year.toString()+day.month.toString()+day.day.toString()).toList());
}

/*

final _kEventoSource = Map.fromIterable(await getAllEventiFromFirestore(user.email!, false),
    key: (item) => DateTime.utc(int.parse(item.anno), int.parse(item.mese), int.parse(item.giorno), int.parse(item.ora), int.parse(item.minuto)),
    value: (item) => listaEventi);
*/

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




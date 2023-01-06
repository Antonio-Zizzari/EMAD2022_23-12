import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:justpet/veterinarian/components/flutter_event_calendar.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/date_symbol_data_local.dart';

class VeterinarianAppointment extends StatefulWidget {
  const VeterinarianAppointment({Key? key}) : super(key: key);
  @override
  State<VeterinarianAppointment> createState() => _VeterinarianAppointmentState();
}

class _VeterinarianAppointmentState extends State<VeterinarianAppointment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final CalendarWeekController _controller = CalendarWeekController();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("it_IT", null).then((_) {});
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey),
      drawer: SideMenu(),
      //backgroundColor: kTertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: CalendarWeek(
                  controller: _controller,
                  height: 100,
                  showMonth: true,
                  //dayOfWeekStyle: TextStyle(color: Colors.black),
                  //dateStyle: TextStyle(color: Colors.black),
                  dayOfWeek: ['LUN', 'MAR', 'MER', 'GIO', 'VEN', 'SAB', 'DOM'],
                  minDate: DateTime.now(),
                  maxDate: DateTime.now().add(
                    Duration(days: 20),
                  ),
                  onDatePressed: (DateTime datetime) {
                    // Do something
                    setState(() {});
                  },
                  onDateLongPressed: (DateTime datetime) {
                    // Do something
                  },
                  onWeekChanged: () {
                    // Do something
                  },
                  monthViewBuilder: (DateTime time) => Align(
                    alignment: FractionalOffset.center,
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          DateFormat.yMMMM('it_IT').format(time).toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        )),
                  ),
                  decorations: [
                  DecorationItem(
                  decorationAlignment: FractionalOffset.bottomRight,
                  date: DateTime.now(),
                  decoration: Icon(
                    Icons.today,
                    color: Colors.blue,
                  )),
              /*DecorationItem(
                  date: DateTime.now().add(Duration(days: 3)),
                  decoration: Text(
                    'Holiday',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w600,
                    ),
                  )),*/
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mattina', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 20,),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: (turni.length~/3)+1,
                    itemBuilder: (context, index){
                      return lista(turni, index);
                    },
                  ),
                  SizedBox(height: 20,),
                  Text('Pomeriggio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 20,),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: (turni_pom.length~/3)+1,
                    itemBuilder: (context, index){
                      return lista(turni_pom, index);
                    },
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Prenota ora'), style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor, fixedSize: Size(500, 40)),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget pulsante (String text){
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: InkWell(
      onTap: (){

      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 45,
        width: 110,
        child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      ),
    ),
  );
}

Widget lista (List<String> turni, int index){
  List<Widget> l = [];
  index=index*3;
  if(index<turni.length-3) {
    for (int i = index; i < index + 3; i++) {
      l.add(pulsante(turni[i]));
      l.add(Spacer());
    }
  }
  else {
    for (int i = index; i < turni.length; i++) {
      l.add(pulsante(turni[i]));
      l.add(SizedBox(width: 10,));
    }
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: l.map((e) => e).toList()
  );
}


List<String> turni = ['9:00','9:15','9:30','9:45',
  '10:00','10:15','10:30','10:45',
  '11:00','11:15','11:30','11:45',
  '12:00','12:15','12:30','12:45',
  '13:00'];

List<String> turni_pom = ['16:00','16:15','16:30',
  '16:45','17:00','17:15','17:30',
  '17:45','18:00','18:15','18:30',
  '18:45','19:00',];
/*
List<String> turni_pom = ['9:00','9:15','9:30','9:45',
  '10:00','10:15','10:30','10:45',
  '11:00','11:15','11:30','11:45',
  '12:00','12:15','12:30','12:45',
  '13:00','16:00','16:15','16:30',
  '16:45','17:00','17:15','17:30',
  '17:45','18:00','18:15','18:30',
  '18:45','19:00',];*/

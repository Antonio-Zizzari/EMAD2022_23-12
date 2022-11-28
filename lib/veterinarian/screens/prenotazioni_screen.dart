import 'package:flutter/material.dart';
import 'package:justpet/veterinarian/components/flutter_event_calendar.dart';
import 'package:justpet/veterinarian/models/event_class.dart';

import '../../global/components/SideMenu.dart';
import '../../global/components/appbar.dart';



class TurniLavoro extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey),
      drawer: SideMenu(),
      body: EventCalendar(
        calendarType: CalendarType.GREGORIAN,
        calendarLanguage: 'it',
        calendarOptions: CalendarOptions(
          viewType: ViewType.DAILY,
          toggleViewType: true,
          //headerMonthBackColor: Colors.redAccent,
          bottomSheetBackColor: Color(0xFFBA9C9C),
          headerMonthBackColor: Colors.white,
          headerMonthShadowColor: Colors.black
        ),
        dayOptions: DayOptions(
          selectedBackgroundColor: Colors.redAccent,
          eventCounterColor: Colors.green,

        ),
        eventOptions: EventOptions(
          emptyTextColor: Colors.red,
          emptyIconColor: Colors.red,),

        events: listaEventi.map((evento) =>
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
                                    onPressed: () {},
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
    );
  }

}




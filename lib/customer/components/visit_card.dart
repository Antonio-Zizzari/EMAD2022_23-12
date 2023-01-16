import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justpet/customer/components/veterinarian_date.dart';
import 'package:justpet/veterinarian/models/event_class.dart';

import '../models/pet_class.dart';

class VisitCard extends StatelessWidget {
  final dynamic visita;
  final Pets data;

  const VisitCard({Key? key, required this.data, required this.visita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VeterinarianDate(data: data, visita: visita),
          ),
        );
      },
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22.0, 10, 50, 10),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${returnItalianDay(DateFormat('EEEE').format(DateTime.utc(int.parse(visita["anno"]), int.parse(visita["mese"]), int.parse(visita["giorno"]))))} ${visita["giorno"]}",
                        style: TextStyle(
                          color: Color(0xff212121),
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "alle ore ${visita["ora"]}:${visita["minuto"]}",
                        style: TextStyle(
                          color: Color(0xff212121),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    thickness: 2,
                    width: 30,
                    color: Colors.black,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(visita["nome_cliente"], style: TextStyle(
                          color: Color(0xff212121),
                          fontSize: 17
                      ),
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Icon(Icons.description_outlined,size: 18,),
                          SizedBox(width: 3,),
                          Container(
                            child: Text(
                                visita["tipoOperazione"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xff666666)
                              )
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  String returnItalianDay(String day){
    switch(day){
      case "Monday":
        return "Lunedi'";
      case "Tuesday":
        return "Martedi'";
      case "Wednesday":
        return "Mercoledi'";
      case "Thursday":
        return "Giovedi'";
      case "Friday":
        return "Venerdi'";
      case "Saturday":
        return "Sabato";
      case "Sunday":
        return "Domenica";
      default:
        return "";
    }
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justpet/visit_class.dart';

class VisitCard extends StatelessWidget {
  final VisitClass visita;

  const VisitCard({Key? key, required this.visita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${returnItalianDay(DateFormat('EEEE').format(visita.data))} ${visita.data.day}",
                      style: TextStyle(
                        color: Color(0xff212121),
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "alle ore ${DateFormat("HH:mm").format(visita.data)}",
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
                    Text(visita.nomeVeterinario, style: TextStyle(
                        color: Color(0xff212121),
                        fontSize: 17
                    ),
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Icon(Icons.description_outlined,size: 18,),
                        SizedBox(width: 3,),
                        Text(visita.descrizione,style: TextStyle(color: Color(0xff666666)))
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 8),
              ],
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

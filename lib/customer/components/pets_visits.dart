import 'package:flutter/material.dart';
import 'package:justpet/customer/components/visit_card.dart';
import 'package:justpet/customer/models/pet_class.dart';

class PetsVisits extends StatelessWidget {
  final Pets data;

  const PetsVisits({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(data.visiteAnnuali.entries.isNotEmpty) {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.deepOrange.withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
              data.visiteAnnuali.entries.map((anno) =>
                Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    collapsedIconColor: Colors.black,
                    iconColor: Colors.black,
                    title: Text(
                    "Anno: ${anno.key.toString()}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w600,
                      ),
                    ),
                  children:
                    anno.value.entries.map((mese) =>
                      Theme(
                        data: ThemeData().copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          collapsedIconColor: Colors.black,
                          iconColor: Colors.black,
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(10,0,0,0),
                            child: Text(
                              returnMonthByNumber(mese.key),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          children:
                            mese.value.map((singleVisit) =>
                              VisitCard(data: data, visita: singleVisit)
                            ).toList()
                        ),
                      ),
                    ).toList()
                  ),
                ),
              ).toList()
          ),
        )
    );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 80,
              width: 80,
              child: Image(
                image: AssetImage(
                  "assets/images/empty_calendar_icon.png"
                ),
              ),
            ),
            Text("Non sono state effettuate visite per questo animale.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    }
  }

  String returnMonthByNumber(int number){
    switch(number){
      case 1:
        return "Gennaio";
      case 2:
        return "Febbraio";
      case 3:
        return "Marzo";
      case 4:
        return "Aprile";
      case 5:
        return "Maggio";
      case 6:
        return "Giugno";
      case 7:
        return "Luglio";
      case 8:
        return "Agosto";
      case 9:
        return "Settembre";
      case 10:
        return "Ottobre";
      case 11:
        return "Novembre";
      case 12:
        return "Dicembre";
      default:
        return "";
    }
  }
}

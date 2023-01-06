import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:intl/intl.dart';
import 'package:justpet/customer/components/visit_card.dart';
import 'package:justpet/customer/models/pet_class.dart';
import 'package:justpet/theme/color.dart';

import '../../global/components/SideMenu.dart';
import '../../global/models/color.dart';
import '../models/visit_class.dart';

class VeterinarianDate extends StatelessWidget {
  final Pets data;
  final VisitClass visita;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  VeterinarianDate({Key? key, required this.data, required this.visita})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Descrizione visita",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${returnItalianDay(DateFormat('EEEE').format(visita.data))} ${visita.data.day}",
                                    style: TextStyle(
                                        color: Color(0xff212121),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
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
                                width: 20,
                                color: Colors.black,
                              ),
                              Center(
                                child: Row(
                                  children: [
                                    Icon(Icons.man_rounded, size: 30),
                                    Text(
                                      visita.nomeVeterinario,
                                      style: TextStyle(
                                          color: Color(0xff212121), fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 20,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.description_outlined, size: 25),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,4),
                              child: Text("DESCRIZIONE VISITA",
                                style: TextStyle(
                                  color: Color(0xff212121),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Icon(Icons.description_outlined, size: 25),
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: Text(
                                visita.descrizione,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 17
                                ),
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                )
              )
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Container(
                  height: 800,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: width,
                              height: 600,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                child: Image.asset(
                                    fit: BoxFit.fitWidth, data.pathImage),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 0,
                              child: GlassContainer(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                blur: 10,
                                opacity: 0.15,
                                child: Container(
                                    width: width - 70,
                                    height: 110,
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 10, 15, 10),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                            bottomLeft: Radius.circular(25),
                                            bottomRight: Radius.circular(25)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: shadowColor.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                2), // changes position of shadow
                                          ),
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.0, horizontal: 0),
                                          child: Center(
                                            child: Text(
                                              data.nome,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.black,
                                                      blurRadius: 8),
                                                ],
                                                color: glassTextColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 8),
                                          child: Center(
                                            child: Text(
                                              data.tipoAnimale,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: glassLabelColor,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.transgender,
                                                  size: 18,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  data.sesso,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.color_lens_outlined,
                                                  size: 18,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  data.colore,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.query_builder,
                                                  size: 18,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  data.eta,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.monitor_weight_outlined,
                                                  size: 20,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  data.peso,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(30),
                        height: height * 0.4,
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            //STORICO MEDICO
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 20, 0),
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  shadowColor.withOpacity(0.1),
                                              spreadRadius: .5,
                                              blurRadius: .5,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: const Center(
                                            child: Icon(Icons.vaccines_sharp,
                                                size: 30, color: Colors.white)),
                                      ),
                                      const Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Tipo Vaccini: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Theme(
                                          data: ThemeData().copyWith(
                                              dividerColor: Colors.transparent),
                                          child: ExpansionTile(
                                            collapsedIconColor:
                                                Colors.orangeAccent,
                                            iconColor: Colors.orangeAccent,
                                            title: const Text(
                                              "Lista",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: data
                                                        .tipiVaccino!.isEmpty
                                                    ? 1
                                                    : data.tipiVaccino!.length,
                                                //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                                                itemBuilder: (context, index) {
                                                  if (data.tipiVaccino!.isEmpty)
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 20, 0),
                                                      child: Text(
                                                        "N/D",
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    );
                                                  else
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 20, 0),
                                                      child: Text(
                                                        data.tipiVaccino![index],
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 20, 0),
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  shadowColor.withOpacity(0.1),
                                              spreadRadius: .5,
                                              blurRadius: .5,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: const Center(
                                            child: Icon(
                                                Icons.medical_services_outlined,
                                                size: 30,
                                                color: Colors.white)),
                                      ),
                                      const Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Tipo Allergie: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Theme(
                                          data: ThemeData().copyWith(
                                              dividerColor: Colors.transparent),
                                          child: ExpansionTile(
                                            collapsedIconColor:
                                                Colors.orangeAccent,
                                            iconColor: Colors.orangeAccent,
                                            title: const Text(
                                              "Lista",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: data.allergie!.isEmpty
                                                    ? 1
                                                    : data.allergie!.length,
                                                //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                                                itemBuilder: (context, index) {
                                                  if (data.allergie!.isEmpty)
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 20, 0),
                                                      child: const Text(
                                                        "N/D",
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    );
                                                  else
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 20, 0),
                                                      child: Text(
                                                        data.allergie![index],
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 20, 0),
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  shadowColor.withOpacity(0.1),
                                              spreadRadius: .5,
                                              blurRadius: .5,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: const Center(
                                            child: Icon(
                                                Icons.food_bank_outlined,
                                                size: 35,
                                                color: Colors.white)),
                                      ),
                                      const Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Tipo\nIntolleranze: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Theme(
                                          data: ThemeData().copyWith(
                                            dividerColor: Colors.transparent,
                                          ),
                                          child: ExpansionTile(
                                            collapsedIconColor:
                                                Colors.orangeAccent,
                                            iconColor: Colors.orangeAccent,
                                            title: const Text(
                                              "Lista",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: data
                                                        .intolleranze!.isEmpty
                                                    ? 1
                                                    : data.intolleranze!.length,
                                                //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                                                itemBuilder: (context, index) {
                                                  if (data.intolleranze!.isEmpty)
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 20, 0),
                                                      child: const Text(
                                                        "N/D",
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    );
                                                  else
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 20, 0),
                                                      child: Text(
                                                        data.intolleranze![
                                                            index],
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String returnItalianDay(String day) {
    switch (day) {
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

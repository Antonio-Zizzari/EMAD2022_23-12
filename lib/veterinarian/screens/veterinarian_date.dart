import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:intl/intl.dart';
import 'package:justpet/customer/models/pet_class.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/veterinarian/models/event_class.dart';
import '../../global/models/color.dart';

class VeterinarianDate extends StatelessWidget {
  final Evento visita;

  VeterinarianDate({Key? key, required this.visita})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: getAnimaleFromFirestore(visita.email_cliente, visita.nome_animale),
        initialData: pets[0],
        builder: (BuildContext context, AsyncSnapshot<Pets> data) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
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
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    elevation: 8,
                    child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                            ),
                            width: width, height: height * 0.65,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              child: Image.asset(
                                  fit: BoxFit.fitWidth, data.data!.pathImage),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: GlassContainer(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              blur: 7,
                              opacity: 0.2,
                              child: Container(
                                  width: width,
                                  padding: const EdgeInsets.fromLTRB(
                                      15, 5, 15, 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.5, color: red5),
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shadowColor.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ]
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 0),
                                        child: Center(
                                          child: Text(
                                            data.data!.nome,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              shadows: [
                                                Shadow(color: Colors.black,
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
                                        padding: EdgeInsets.fromLTRB(
                                            0, 0, 0, 8),
                                        child: Center(
                                          child: Text(
                                            data.data!.tipoAnimale, maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: glassLabelColor,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.transgender, size: 18,
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),),
                                              SizedBox(width: 3,),
                                              Text(data.data!.sesso, maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontSize: 13),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.color_lens_outlined,
                                                size: 18,
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),),
                                              SizedBox(width: 3,),
                                              Text(data.data!.colore, maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontSize: 13),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.query_builder, size: 18,
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),),
                                              SizedBox(width: 3,),
                                              Text(data.data!.eta, maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontSize: 13),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.monitor_weight_outlined,
                                                size: 20,
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),),
                                              SizedBox(width: 3,),
                                              Text(data.data!.peso, maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontSize: 13),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          iconColor: Colors.white,
                                          collapsedIconColor: Colors.white,
                                          title: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                5, 0, 0, 0),
                                            child: Text(
                                              "Espandi storico medico animale",
                                              style: TextStyle(
                                                  color: Colors.white),),
                                          ),
                                          subtitle: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                5, 0, 0, 0),
                                            child: Text(
                                              "Intolleranze, Vaccini, Allergie",
                                              style: TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 12),),
                                          ),
                                          children: [
                                            mostraStoricoMedico(data.data!)
                                          ],
                                        ),
                                      ),
                                    ],

                                  )
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(35),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(35),
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: IntrinsicHeight(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .stretch,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceAround,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .end,
                                                  children: [
                                                    Text(
                                                      "${visita.giorno}/${visita
                                                          .mese}/${visita
                                                          .anno}",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff212121),
                                                          fontSize: 17,
                                                          fontWeight: FontWeight
                                                              .w500),
                                                    ),
                                                    Text(
                                                      "alle ore ${visita
                                                          .ora}:${visita
                                                          .minuto}",
                                                      style: TextStyle(
                                                        color: Color(
                                                            0xff212121),
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
                                                      Icon(Icons.man_rounded,
                                                          size: 30),
                                                      Text(
                                                        visita.nome_cliente,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff212121),
                                                            fontSize: 18,
                                                            fontWeight: FontWeight
                                                                .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 22),
                                          child: Divider(
                                            thickness: 1,
                                            height: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            Icon(Icons.description_outlined,
                                                size: 25),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .fromLTRB(8, 8, 8, 4),
                                              child: Text("DESCRIZIONE VISITA",
                                                style: TextStyle(
                                                    color: Color(0xff212121),
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                            Icon(Icons.description_outlined,
                                                size: 25),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 15.0),
                                          child: Text(
                                            "Il cane spesso rimette sul pavimento di casa dopo aver mangiato i croccantini che gli ho comprato. Chiedo il suo aiuto dottore!",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 16
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
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

Widget mostraStoricoMedico(Pets data){
  return Container(
    margin: EdgeInsets.fromLTRB(10,0,10,10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: red5, width: 1.5),
      color: Colors.transparent.withOpacity(0.05),
      borderRadius: BorderRadius.circular(25),
    ),
    //STORICO MEDICO
    child: Table(
      columnWidths: const {
        0: FlexColumnWidth(0.5),
        1: FlexColumnWidth(0.8),
        2: FlexColumnWidth(1)
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            children: [
              SizedBox(height: 10),
              SizedBox(height: 10),
              SizedBox(height: 10)
            ]
        ),
        TableRow(
          children: [
            Container(
              width: 40, height: 40,
              margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.1),
                    spreadRadius: .5,
                    blurRadius: .5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: const Center(child: Icon(Icons.vaccines_sharp, size: 30, color: Colors.white)),
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                flex: 3,
                child: Text("Vaccini",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                flex: 5,
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    collapsedIconColor: Colors.white,
                    iconColor: Colors.white,
                    title: const Text(
                      "Apri Lista",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.tipiVaccino!.isEmpty ? 1 : data.tipiVaccino!.length, //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                        itemBuilder: (context, index) {
                          if(data.tipiVaccino!.isEmpty)
                            return Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text(
                                "N/D",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          else
                            return Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text(
                                data.tipiVaccino![index],
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ]
            ),
          ]
        ),
        TableRow(
            children: [
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20)
            ]
        ),
        TableRow(
            children: [
              Container(
                width: 40, height: 40,
                margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.1),
                      spreadRadius: .5,
                      blurRadius: .5,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(child: Icon(Icons.medical_services_outlined, size: 30, color: Colors.white)),
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                  flex: 3,
                  child: Text("Allergie",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ]
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                  flex: 5,
                  child: Theme(
                    data: ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.white,
                      title: const Text(
                        "Apri Lista",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.allergie!.isEmpty ? 1 : data.allergie!.length, //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                          itemBuilder: (context, index) {
                            if(data.allergie!.isEmpty)
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: const Text(
                                  "N/D",
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            else
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text(
                                  data.allergie![index],
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ]
              )
            ]
        ),
        TableRow(
            children: [
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20)
            ]
        ),
        TableRow(
            children: [
              Container(
                width: 40, height: 40,
                margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.1),
                      spreadRadius: .5,
                      blurRadius: .5,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(child: Icon(Icons.food_bank_outlined, size: 35, color: Colors.white)),
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text("Intolleranze ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ]
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 5,
                    child: Theme(
                      data: ThemeData().copyWith(dividerColor: Colors.transparent,),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        iconColor: Colors.white,
                        title: const Text(
                          "Apri Lista",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.intolleranze!.isEmpty ? 1 : data.intolleranze!.length, //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                            itemBuilder: (context, index) {
                              if(data.intolleranze!.isEmpty)
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: const Text(
                                    "N/D",
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              else
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: Text(
                                    data.intolleranze![index],
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ),
            ]
        ),
        TableRow(
            children: [
              SizedBox(height: 10),
              SizedBox(height: 10),
              SizedBox(height: 10)
            ]
        ),
      ],
    )
  );
}

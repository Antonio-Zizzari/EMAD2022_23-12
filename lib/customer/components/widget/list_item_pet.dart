import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/models/pet_class.dart';
import 'package:justpet/theme/color.dart';

class ListItemPet extends StatelessWidget {
  final Pets data;

  const ListItemPet({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
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
        //STORICO MEDICO
        /* child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const Expanded(
                  flex: 3,
                  child: Text("Vaccini",
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
                    data: ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.orangeAccent,
                      iconColor: Colors.orangeAccent,
                      title: const Text(
                        "Apri Lista",
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
                        itemCount: data.tipiVaccino!.isEmpty ? 1 : data.tipiVaccino!.length, //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                        itemBuilder: (context, index) {
                          if(data.tipiVaccino!.isEmpty)
                            return Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text(
                                "N/D",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.black,
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
                                  color: Colors.black,
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
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const Expanded(
                  flex: 3,
                  child: Text("Allergie",
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
                    data: ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.orangeAccent,
                      iconColor: Colors.orangeAccent,
                      title: const Text(
                        "Apri Lista",
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
                          itemCount: data.allergie!.isEmpty ? 1 : data.allergie!.length, //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                        itemBuilder: (context, index) {
                          if(data.allergie!.isEmpty)
                            return Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: const Text(
                                "N/D",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.black,
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
                                  color: Colors.black,
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
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const Expanded(
                  flex: 3,
                  child: Text("Intolleranze ",
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
                    data: ThemeData().copyWith(dividerColor: Colors.transparent,),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.orangeAccent,
                      iconColor: Colors.orangeAccent,
                      title: const Text(
                        "Apri Lista",
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
                          itemCount: data.intolleranze!.isEmpty ? 1 : data.intolleranze!.length, //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                        itemBuilder: (context, index) {
                          if(data.intolleranze!.isEmpty)
                            return Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: const Text(
                                "N/D",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.black,
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
                                  color: Colors.black,
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
                )
              ],
            ),
          ],
        ),*/
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
                  children:[ Expanded(
                    flex: 3,
                    child: Text("Vaccini",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),]
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [Expanded(
                    flex: 5,
                    child: Theme(
                      data: ThemeData().copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.orangeAccent,
                        iconColor: Colors.orangeAccent,
                        title: const Text(
                          "Apri Lista",
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
                            itemCount: data.tipiVaccino!.isEmpty ? 1 : data.tipiVaccino!.length, //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                            itemBuilder: (context, index) {
                              if(data.tipiVaccino!.isEmpty)
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: Text(
                                    "N/D",
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.black,
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
                                      color: Colors.black,
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
                  ),]
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
                        color: Colors.black,
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
                        collapsedIconColor: Colors.orangeAccent,
                        iconColor: Colors.orangeAccent,
                        title: const Text(
                          "Apri Lista",
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
                            itemCount: data.allergie!.isEmpty ? 1 : data.allergie!.length, //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                            itemBuilder: (context, index) {
                              if(data.allergie!.isEmpty)
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: const Text(
                                    "N/D",
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.black,
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
                                      color: Colors.black,
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
                  )
                  ],
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
                        color: Colors.black,
                        fontSize: 16.5,
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
                      data: ThemeData().copyWith(dividerColor: Colors.transparent,),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.orangeAccent,
                        iconColor: Colors.orangeAccent,
                        title: const Text(
                          "Apri Lista",
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
                            itemCount: data.intolleranze!.isEmpty ? 1 : data.intolleranze!.length, //Serve per far funzionare i controlli sotto, perchè se itemCount == 0 il codice sotto non viene eseguito.
                            itemBuilder: (context, index) {
                              if(data.intolleranze!.isEmpty)
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: const Text(
                                    "N/D",
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.black,
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
                                      color: Colors.black,
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
      ),
    );
  }
}


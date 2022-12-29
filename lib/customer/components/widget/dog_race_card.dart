import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';

import '../../../theme/color.dart';
import '../../models/dog_race_class.dart';

class DogRaceCard extends StatelessWidget {
  final DogRace dogRace;
  final MaterialButton buttonType;
  const DogRaceCard({Key? key, required this.dogRace, required this.buttonType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SizedBox(height: 10),
          Material(
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Material(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(dogRace.pathImage, fit: BoxFit.fill)
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                bottom: 15,
                                child: Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(35),
                                  child: buttonType
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Text(dogRace.race,
                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Theme(
                          data: ThemeData().copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                              collapsedIconColor: Colors.black,
                              iconColor: Colors.black,
                              title: Text(
                                "Espandi descrizione",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              children: [
                                Text(dogRace.description, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54, fontSize: 14),),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

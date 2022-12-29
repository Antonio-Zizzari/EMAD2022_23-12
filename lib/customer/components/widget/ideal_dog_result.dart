import 'package:flutter/material.dart';
import 'package:justpet/customer/components/widget/dog_race_card.dart';
import 'package:justpet/customer/screens/favorite_dogs_race_screen.dart';

import '../../../global/components/SideMenu.dart';
import '../../../global/components/appbar.dart';
import '../../../global/models/color.dart';
import '../../models/dog_race_class.dart';
import '../../screens/ListaVeterinari.dart';

class IdealDogResult extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  IdealDogResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: MainAppBar(_scaffoldKey),
        drawer: SideMenu(),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green.withOpacity(0.7),
          label: Text("Ritorna alle razze preferite"),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context){
                    return const FavoriteDogsRace();
                  }
              ),(r){
                return false;
              },
            );
          }
        ),
        body: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Razze compatibili",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            dogRaces.isNotEmpty ? Expanded(
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 10.0),
                        child: Text(
                          dogRaces.length == 1 ? '${dogRaces.length} razza' : '${dogRaces.length} Razze',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: Column(
                          children: dogRaces.map((race) =>
                            DogRaceCard(
                              dogRace: race,
                              buttonType: MaterialButton(
                                color: kPrimaryColor,
                                minWidth: 50,
                                height: 50,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                //DA MODIFICARE
                                onPressed: () {},
                                padding: EdgeInsets.all(5),
                                child: Center(child: Icon(Icons.star, color: Colors.yellowAccent, size: 30,)),
                              ))
                            ).toList()
                        ),
                      ),
                    ],
                  )
              ),
            ) : Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                  const Icon(Icons.pets_sharp, size: 80),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0,0,0,40),
                    child: Text("Non è presente alcuna razza nella lista.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}

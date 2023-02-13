import 'package:firebase_auth/firebase_auth.dart';
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
  final user = FirebaseAuth.instance.currentUser!;
  List<DogRace> razza;
  IdealDogResult({Key? key, required this.razza}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DogRace initialRace = DogRace(race: 'errore', description: 'errore', pathImage: 'errore');
    List<DogRace> initialData = List.filled(0, initialRace, growable: true);
    int index=0;

    return FutureBuilder(
      future: getAllRazzeFromFirestore(user.email!),
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot<List<DogRace>> razze) {
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
                        builder: (BuildContext context) {
                          return const FavoriteDogsRace();
                        }
                    ), (r) {
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
                razza.isNotEmpty ? Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 10.0),
                            child: Text(
                              razza.length == 1
                                  ? '${razza.length} razza'
                                  : '${razza.length} Razze',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                                children: razza.asMap().entries.map((race) {
                                  return DogRaceCard(
                                      dogRace: race.value,
                                      buttonType: MaterialButton(
                                        color: kPrimaryColor,
                                        minWidth: 50,
                                        height: 50,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius
                                                .circular(50)
                                        ),
                                        //DA MODIFICARE
                                        onPressed: () {
                                          setDogRaceToFirestore(
                                              user.email!, razza[race.key]);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              behavior: SnackBarBehavior
                                                  .floating,
                                              backgroundColor: Colors.white,
                                              elevation: 25.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),

                                              ),
                                              content: Row(children: [
                                                Icon(Icons.add_box,
                                                  color: kPrimaryColor,),
                                                SizedBox(width: 5,),
                                                Text(razza[race.key].race +
                                                    " aggiunto con successo!",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .bold),)
                                              ],
                                              )));
                                        },
                                        padding: EdgeInsets.all(5),
                                        child: Center(child: Icon(Icons.star,
                                          color: Colors.yellowAccent,
                                          size: 30,)),
                                      ));
                                }
                                ).toList()
                            ),
                          ),
                        ],
                      )
                  ),
                ) : Center(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.35),
                      const Icon(Icons.pets_sharp, size: 80),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
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
    );
  }
}

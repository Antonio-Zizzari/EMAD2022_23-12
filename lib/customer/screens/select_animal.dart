import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/components/add_pet.dart';
import 'package:justpet/customer/models/cliente.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/customer/components/widget/pet_item.dart';
import 'package:justpet/customer/models/pet_class.dart';

import 'package:justpet/global/components/SideMenu.dart';
import '../../global/components/appbar.dart';

class SelectAnimal extends StatefulWidget {
  const SelectAnimal({ Key? key }) : super(key: key);

  @override
  _SelectAnimalState createState() => _SelectAnimalState();
}

class _SelectAnimalState extends State<SelectAnimal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser!;
  late int animaleScelto=0;

  @override
  Widget build(BuildContext context) {
    Pets initialPet = Pets(nome: 'errore', tipoAnimale: 'errore', colore: 'errore', sesso: 'errore', eta: 'errore', peso: 'errore', pathImage: 'errore', tipiVaccino: [], intolleranze: [], allergie: [], visiteAnnuali: {});
    List<Pets> initialData = List.filled(0, initialPet, growable: true);
    return FutureBuilder( //SI PUO RIMUOVERE
        future: getAllAnimaliFromFirestore(user.email!),
        initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot<List<Pets>> animali) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: Text("I tuoi animali",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            body: Column(
              children: [
                buildBody(animali.data!),
              ],
            ),
          );
        }
    );
  }



  buildBody(List<Pets> animali){
    return
      SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Text(
                      "I miei animali",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              getPets(animali),
              Center(
                child: IconButton(
                  iconSize: 50,
                  color: Color.fromRGBO(0,143,57, 1),
                  icon: Icon(Icons.add_circle_sharp, color: kPrimaryColor),
                  onPressed: () {
                    if(animali.length>0) {
                      Navigator.pop(context, animali[animaleScelto]);
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          elevation: 25.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              )
                          ),
                          content: Row(children: [Icon(Icons.warning, color: kPrimaryColor,), SizedBox(width: 5,), Text("Devi scegliere un animale!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)],
                          )));
                    }
                  },
                ),
              ),
              const Center(
                child: Text(
                  "Scegli animale",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      letterSpacing: 1
                  ),
                ),
              ),
            ]
        ),
      );
  }

  getPets(List<Pets> animali){
    double width = MediaQuery.of(context).size.width * .8;
    if(animali.isNotEmpty) {
      return CarouselSlider(
          options: CarouselOptions(
            height: 535,
            enlargeCenterPage: true,
            disableCenter: true,
            viewportFraction: .8,
            onPageChanged: (index, reason){
              animaleScelto=index;
            }
          ),
          items: List.generate(
              animali.length, (index) =>
              PetItem(
                data: animali[index],
                index: index,
                width: width,
              )
          ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets_sharp, size: 80),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,40),
              child: Text("Non sono presenti animali registrati.",
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
      );
    }
  }
}
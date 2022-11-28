import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/components/add_pet.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/customer/components/widget/pet_item.dart';
import 'package:justpet/customer/models/pet_class.dart';

import 'package:justpet/global/components/SideMenu.dart';
import '../../global/components/appbar.dart';

class MyPets extends StatefulWidget {
  const MyPets({ Key? key }) : super(key: key);

  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey),
      drawer: SideMenu(),
      body: Column(
        children: [
          buildBody(),
        ],
      ),
    );
  }



  buildBody(){
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
              getPets(),
              Center(
                child: IconButton(
                  iconSize: 50,
                  color: Color.fromRGBO(0,143,57, 1),
                  icon: Icon(Icons.add_circle_sharp),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPet(),
                      ),
                    );
                  },
                ),
              ),
              const Center(
                child: Text(
                  "Aggiungi un nuovo animale",
                  style: TextStyle(
                    color: Color.fromRGBO(0,143,57, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                    letterSpacing: 2.2
                  ),
                ),
              ),
            ]
        ),
      );
  }

  getPets(){
    double width = MediaQuery.of(context).size.width * .8;
    if(pets.isNotEmpty) {
      return CarouselSlider(
        options: CarouselOptions(
          height: 535,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .8,
        ),
        items: List.generate(
            pets.length, (index) =>
            PetItem(
              data: pets[index],
              index: index,
              width: width,
            )
        )
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 80,
              width: 80,
              child: Icon(Icons.pets_sharp, size: 80)
            ),
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
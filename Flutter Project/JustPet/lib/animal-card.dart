import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:justpet/add_pet.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/veterinarian_date.dart';
import 'package:justpet/widget/pet_item.dart';
import 'package:justpet/pet_class.dart';

class MyPets extends StatefulWidget {
  const MyPets({ Key? key }) : super(key: key);

  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildBody(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/AppBarIcon.png"),
            color: Colors.black,
            iconSize: 40,
          ),


          //SizedBox(width: 150,),
          Row(
            children: [
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'JustPet',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Color(0xFFF03738)!,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'JustPet',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15,),
              CircleAvatar(
                backgroundImage: AssetImage("assets/logo/logo.png"),
                backgroundColor: Colors.transparent,
                radius: 25,
              ),
            ],
          ),

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
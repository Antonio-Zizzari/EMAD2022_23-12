import 'package:flutter/material.dart';
import 'package:justpet/customer/components/AppBarVeterinario.dart';
import 'package:justpet/customer/screens/DettagliVideoCorso.dart';
import 'package:justpet/customer/models/Corso.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utils/search_bar_widget.dart';

class Corsi extends StatefulWidget {
  @override
  State<Corsi> createState() => _CorsiState();
}

class _CorsiState extends State<Corsi> {
  final Function(String query) queryFunction = corsiSearchBarQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarVeterinario(title: '', showSearch: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 15, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.6,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 0.8,
                  autoPlay: true,
                ),
                items: corsi.map((e) => ContainerCorsoSlider(corso: e)).toList(),
              ),
              //AAAA
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 20),
              //   height: 50,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(40),
              //     border: Border.all(color: Colors.grey, style: BorderStyle.solid)
              //   ),
              //   child: SearchBarWidget(queryFunction: queryFunction, hintText: "Cerca videocorso"),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("In evidenza",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFA0A5BD),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /*Text(
                    "Vedi tutti",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0D1333),
                      // fontWeight: FontWeight.bold,
                    ).copyWith(color: Color(0xFF6E8AFA)),
                  ),*/
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 350,
                    height: 200,
                    child: ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: corsi.length,
                    itemBuilder: (context, index) {
                        return ContainterCorso(index: index,);
                    },
                ),
                  ),
              ]
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Nuovi corsi",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFA0A5BD),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /*Text(
                    "Vedi tutti",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0D1333),
                      // fontWeight: FontWeight.bold,
                    ).copyWith(color: Color(0xFF6E8AFA)),
                  ),*/
                ],
              ),
              SizedBox(height: 15),
              Row(
                  children: [
                    Container(
                      width: 350,
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: corsi.length,
                        itemBuilder: (context, index) {
                          return ContainterCorso(index: index,);
                        },
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainterCorso extends StatelessWidget {

  final int index;

  ContainterCorso({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => DettagliVideoCorso(
                  corso: corsi[index]
              )
          ));
        },
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(blurRadius: 5.0, spreadRadius: 1.0, color: Colors.grey.shade400)
            ],
            image: DecorationImage(
              image: AssetImage(corsi[index].immagine),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  corsi[index].titolo,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0D1333),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${corsi[index].numeroVideo} video',
                  style: TextStyle(
                    color: Color(0xFF0D1333).withOpacity(.5),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.yellow[600],
                    ),
                    Text('${corsi[index].valutazione}/5.0',style: TextStyle(fontSize: 18),),
                    Spacer(),
                    Text('${corsi[index].prezzo}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerCorsoSlider extends StatelessWidget{

  final Corso corso;

  ContainerCorsoSlider({
    required this.corso
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => DettagliVideoCorso(
                corso: corso
            )
        ));
      },
      child: Container(
          decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage(corso.immagine),
            fit: BoxFit.cover,
          ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(blurRadius: 5.0, spreadRadius: 1.0, color: Colors.grey.shade400)
            ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                corso.titolo,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF0D1333),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.yellow[600],
                  ),
                  Text('${corso.valutazione}/5.0',style: TextStyle(fontSize: 18),),
                  Spacer(),
                  Text('${corso.prezzo}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void corsiSearchBarQuery(String query){
  return;
}
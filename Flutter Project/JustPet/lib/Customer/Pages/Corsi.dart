import 'package:flutter/material.dart';
import 'package:justpet/Customer/Cust_Component/AppBarVeterinario.dart';
import 'package:justpet/Customer/Cust_Component/SideMenu.dart';
import 'package:justpet/Customer/Pages/DettagliVideoCorso.dart';
import 'package:justpet/global_models/appbar.dart';
import 'package:justpet/Customer/Cust_Component/Corso.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:justpet/global_variables/colors.dart';

class Corsi extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.red,

        title: Text("Video Corsi per",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor
          ),),
      ) ,
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 5, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.grey, style: BorderStyle.solid)
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.search),
                  SizedBox(width: 16, height: 1,),
                  Text(
                    "Cerca corso",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD),
                    ),
                  )
                ],
              ),
            ),
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
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
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
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  spreadRadius: 4,
                                  offset: Offset(0, 10),
                                ),
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
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
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
                      },
                    ),
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}

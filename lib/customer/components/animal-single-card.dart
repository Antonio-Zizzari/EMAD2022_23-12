import 'package:justpet/customer/components/veterinarian_date.dart';
import 'package:justpet/customer/components/widget/info_list.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/customer/models/pet_class.dart';

import '../../global/models/color.dart';

class AnimalCard extends StatelessWidget {
  final Pets data;

  const AnimalCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Il tuo pet",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: buildBody(width, height, data, context),
    );
  }
}

Widget buildBody(double width, double height, Pets data, BuildContext context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: Container(
          width: width,
          height: height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          ),
          child: Stack(
            children: [
              Container(
                width: width, height: 600,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                  child: Image.asset(fit: BoxFit.fitWidth, data.pathImage),
                ),
              ),
              Positioned(
                bottom: 0,
                child: GlassContainer(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
                  blur: 10,
                  opacity: 0.15,
                  child: Container(
                      width: width,
                      height: 110,
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
                          boxShadow: [
                            BoxShadow(
                              color: shadowColor.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
                            child: Center(
                              child: Text(
                                data.nome,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  shadows: [
                                    Shadow(color: Colors.black, blurRadius: 8),
                                  ],
                                  color: glassTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Center(
                              child: Text(data.tipoAnimale, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: glassLabelColor, fontSize: 13),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.transgender, size: 18, color: Color.fromRGBO(255, 255, 255, 1),),
                                  SizedBox(width: 3,),
                                  Text(data.sesso, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 13),),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.color_lens_outlined, size: 18, color: Color.fromRGBO(255, 255, 255, 1),),
                                  SizedBox(width: 3,),
                                  Text(data.colore, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 13),),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.query_builder, size: 18, color: Color.fromRGBO(255, 255, 255, 1),),
                                  SizedBox(width: 3,),
                                  Text(data.eta, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 13),),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.monitor_weight_outlined, size: 20, color: Color.fromRGBO(255, 255, 255, 1),),
                                  SizedBox(width: 3,),
                                  Text(data.peso, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 13),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              ),
          ],
        ),
        ),
      ),
      Container(
        height: height * 0.4,
        child: InfoList(data: data),
      ),
    ],
  );
}

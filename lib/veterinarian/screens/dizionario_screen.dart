import 'package:flutter/material.dart';
import 'package:justpet/utils/search_bar_widget.dart';
import 'package:justpet/veterinarian/models/medicine_class.dart';

import '../../global/components/SideMenu.dart';
import '../../global/models/alphabets.dart';
import '../../global/components/appbar.dart';
import '../../global/models/color.dart';

class DizionarioScreen extends StatefulWidget {
  const DizionarioScreen({Key? key}) : super(key: key);

  @override
  State<DizionarioScreen> createState() => _DizionarioScreenState();
}

class _DizionarioScreenState extends State<DizionarioScreen> {
  final Function(String query) queryFunction = dizionarioSearchBarQuery;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var selezionato=List.generate(alphabets.length, (index) => false);
  int precedente=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey),
      drawer: SideMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(25,15,25,5),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text("Dizionario",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,

              ),
              )
          ),
          //AAAA
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: SearchBarWidget(queryFunction: dizionarioSearchBarQuery, hintText: "Cerca un farmaco"),
          // ),
          Container(
            child: Text("Alfabeto", style: TextStyle(color: Color(0xff666666),fontSize: 22),),
            margin: const EdgeInsets.fromLTRB(25,15,25,5),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: alphabets.length,
                itemBuilder: (context, index) =>
                    LayoutBuilder(
                      builder: (context,constrains) => Row(
                        children: [
                          SizedBox(width: 25,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selezionato[precedente]=false;
                                    if(selezionato[index] == false){
                                      selezionato[index]=true;

                                    }else{
                                      selezionato[index]=false;
                                    }
                                    precedente=index;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: selezionato[index] == true ? Colors.red[200] : Colors.transparent,

                                  child: Text(
                                    alphabets[index],
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
            )
          ),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  itemCount: listaMedicine.length,
                  itemBuilder: (context, index) =>
                      Card(
                        shadowColor: kPrimaryColor,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Image(image: AssetImage(listaMedicine[index].image),
                                  )
                                  ),
                                ),
                                VerticalDivider(
                                  thickness: 2,
                                  width: 20,
                                  color: kPrimaryColor,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listaMedicine[index].nome, style: TextStyle(
                                        color: Color(0xff212121),
                                        fontSize: 22
                                      ),
                                    ),
                                    Text(listaMedicine[index].tipo, style: TextStyle(color: Color(0xff666666),fontSize: 18),),


                                  ],
                                ),
                                Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.arrow_circle_right_rounded),
                                        color: Colors.redAccent,),
                                    )),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),
                      ),
              )
          ),

        ],
      ) ,
    );
  }
}
void dizionarioSearchBarQuery(String query){
  return;
}

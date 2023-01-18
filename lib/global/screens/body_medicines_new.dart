import 'package:flutter/material.dart';
import 'package:justpet/global/components/categoryItem.dart';
import 'package:justpet/global/models/bodyPartClass.dart';
import 'package:justpet/global/models/color.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:card_loading/card_loading.dart';
import 'package:justpet/customer/components/petshop.dart';
import 'package:justpet/global/models/medicine_help_class.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


class BodyMedicine extends StatefulWidget{

  @override
  State<BodyMedicine> createState() => _BodyMedicineState();
}

class _BodyMedicineState extends State<BodyMedicine> {
  final List<SnappingPosition> positions = [
    SnappingPosition.pixels(
      positionPixels: 250,
      snappingCurve: Curves.easeOut,
      snappingDuration: Duration(milliseconds: 300),
    ),
    SnappingPosition.pixels(
      positionPixels: 700,
      snappingCurve: Curves.easeOut,
      snappingDuration: Duration(milliseconds: 300),
    ),
  ];

  Widget sheetBelow = baseSliderScreen();
  SnappingSheetController controller = SnappingSheetController();
  bool changed = false;
  String categoria="";
  int tabIndex=0;


  void changeSheet() {
    setState(() {
      sheetBelow = sliderScreen();
      if (!changed) {
        final position = positions[0];
        positions[0] = positions[1];
        positions[1] = position;
        changed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: MainAppBar(scaffoldKey),
      drawer: SideMenu(),
      body: SnappingSheet(
        //lockOverflowDrag: true,
        initialSnappingPosition: positions[0],
        snappingPositions: positions,
        sheetBelow: SnappingSheetContent(
            draggable: true,
            child: sheetBelow
        ),
        child: backgroundScreen(function: changeSheet),
        controller: controller,
      ),
    );
  }




  Widget sliderScreen() {
    Future<bool> _setInterval() async {
      await Future.delayed(Duration(seconds: 3));
      return true;
    }

    return FutureBuilder(
      future: _setInterval(),
      builder: (context, intervalSnapshot) {
        if (!intervalSnapshot.hasData) {
          return containerWithoutAnimation(true, context);
        }
        return containerWithoutAnimation(false, context);
      },
    );
  }

/*
Widget containerWithAnimation(){
  return SingleChildScrollView(
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: Colors.black.withOpacity(0.6),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        color: Colors.white,
      ),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 100.0,
              height: 8.0,
              //margin: EdgeInsets.only(left: 135.0, bottom: 15.0),
              decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            cardLoading(),
            cardLoading(),
            cardLoading()
          ],
        ),
      ),
    ),
  );
}
*/

  Widget containerWithoutAnimation(bool animation, BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: Colors.black.withOpacity(0.6),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              width: 100.0,
              height: 8.0,
              margin: EdgeInsets.only(left: 135.0, bottom: 15.0),
              decoration: BoxDecoration(color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 35, 15, 15),
              child: animation ? cardLoading() : SingleChildScrollView(
                child: Column(
                  children: medicines.map((medicine) =>
                  medicine.categorie.contains(categoria) ? Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                  color: kTertiaryColor
                              ),
                              child: Text(medicine.titolo, style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                          Image.asset(
                            medicine.immagine,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                            child: Text(
                              medicine.descrizione,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(
                                      builder: (context) => PetShop()
                                  ));
                                },
                                child: Text('Vai ai Petshop ->'),
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: kTertiaryColor
                                )
                            ),
                          ),
                        ],
                      ),)
                    ,
                  ) : Container()).toList(),
                ),
              ),
            ),
            //ListView.builder(itemBuilder: itemBuilder)
          ],
        ),
      ),
    );
  }

  Widget backgroundScreen({required VoidCallback function}) {
    return DefaultTabController(
      initialIndex: tabIndex,
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black26,
              indicator: MaterialIndicator(
                horizontalPadding: 30,
                topLeftRadius: 20,
                topRightRadius: 20,
                color: Colors.orangeAccent,
                paintingStyle: PaintingStyle.fill,
              ),
              tabs: [
                Tab(text: "Cani"),
                Tab(text: "Gatti"),
              ],
            ),
          ),
          Expanded(
            flex: 14,
            child: TabBarView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/dog_body.png",
                        fit: BoxFit.cover,
                        scale: 0.5,
                      ),
                    ),
                    ...listaPartiCane.map((e) => Positioned(
                      top: e.top,
                      right: e.right,
                      bottom: e.bottom,
                      left: e.left,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          tabIndex=0;
                          categoria=e.text;
                          changeSheet();
                        },
                        icon: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: kTertiaryColor.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(e.icon)
                        ),
                        label: Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              e.text,
                              style: TextStyle(
                                fontSize: 20,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = kPrimaryColor,
                              ),
                            ),
                            // Solid text as fill.
                            Text(
                              e.text,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            foregroundColor: e.color,
                            //backgroundColor: Colors.grey.withOpacity(0.5),
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      )
                    ),
                    ).toList(),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/cat_body.jpg",
                        fit: BoxFit.cover,
                        scale: 0.5,
                      ),
                    ),
                    ...listaPartiGatto.map((e) => Positioned(
                        top: e.top,
                        right: e.right,
                        bottom: e.bottom,
                        left: e.left,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            tabIndex=1;
                            categoria=e.text;
                            changeSheet();
                          },
                          icon: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: kTertiaryColor.withOpacity(0.6),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(e.icon)
                          ),
                          label: Stack(
                            children: <Widget>[
                              // Stroked text as border.
                              Text(
                                e.text,
                                style: TextStyle(
                                  fontSize: 20,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 4
                                    ..color = kPrimaryColor,
                                ),
                              ),
                              // Solid text as fill.
                              Text(
                                e.text,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              foregroundColor: e.color,
                              //backgroundColor: Colors.grey.withOpacity(0.5),
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        )
                    ),
                    ).toList(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              flex: 8,
              child: SizedBox()
          ),
        ],
      ),
    );
  }


  Widget cardLoading() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardLoading(
            height: 30,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            width: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          CardLoading(
            height: 100,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            margin: EdgeInsets.only(bottom: 10),
          ),
          CardLoading(
            height: 30,
            width: 200,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            margin: EdgeInsets.only(bottom: 10),
          ),
          CardLoading(
            height: 30,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            width: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          CardLoading(
            height: 100,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            margin: EdgeInsets.only(bottom: 10),
          ),
          CardLoading(
            height: 30,
            width: 200,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            margin: EdgeInsets.only(bottom: 10),
          ),
          CardLoading(
            height: 30,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            width: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          CardLoading(
            height: 100,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            margin: EdgeInsets.only(bottom: 10),
          ),
          CardLoading(
            height: 30,
            width: 200,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            margin: EdgeInsets.only(bottom: 10),
          ),
        ],
      ),
    );
  }

}

Widget baseSliderScreen() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 8.0,
          color: Colors.black.withOpacity(0.6),
        )
      ],
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 100.0,
            height: 8.0,
            //margin: EdgeInsets.only(left: 135.0, bottom: 15.0),
            decoration: BoxDecoration(color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Title(color: Colors.black,
                child: Text('Scegli una parte del corpo per continuare',
                  style: TextStyle(fontSize: 20),)),
          )
        ],
      ),
    ),
  );
}
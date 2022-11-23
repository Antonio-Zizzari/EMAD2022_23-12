import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:justpet/Customer/Cust_Component/AppBarVeterinario.dart';
import 'package:justpet/Customer/Cust_Component/Corso.dart';
import 'package:justpet/global_models/appbar.dart';
import 'package:justpet/Customer/Cust_Component/ContenutoCorso.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class DettagliVideoCorso extends StatelessWidget {
  final Corso corso;
  DettagliVideoCorso({Key? key, required this.corso}) : super(key: key);


  static const kTextColor = Color(0xFF0D1333);
  static const kBlueColor = Color(0xFF6E8AFA);
  static const kBestSellerColor = Color(0xFFFFD073);
  static const kGreenColor = Color(0xFF49CC96);

// My Text Styles
  static const kHeadingextStyle = TextStyle(
    fontSize: 28,
    color: kTextColor,
    fontWeight: FontWeight.bold,
  );
  static const kSubheadingextStyle = TextStyle(
    fontSize: 24,
    color: Color(0xFF61688B),
    height: 2,
  );

  static const kTitleTextStyle = TextStyle(
    fontSize: 20,
    color: kTextColor,
    fontWeight: FontWeight.bold,
  );

  static const kSubtitleTextSyule = TextStyle(
    fontSize: 18,
    color: kTextColor,
    // fontWeight: FontWeight.bold,
  );

  final List<SnappingPosition> positions = [
    SnappingPosition.pixels(
      positionPixels: 350,
      snappingCurve: Curves.easeOut,
      snappingDuration: Duration(milliseconds: 300),
    ),
    SnappingPosition.pixels(
      positionPixels: 700,
      snappingCurve: Curves.easeOut,
      snappingDuration: Duration(milliseconds: 300),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnappingSheet(
        initialSnappingPosition: positions[0],
        snappingPositions: positions,
        sheetBelow: SnappingSheetContent(
          draggable: true,
          child: widgetScrollabile(),
        ),
        child: widgetSfondo(),
      ),
    );
  }

  Widget widgetSfondo() {
    return Container(
      margin: EdgeInsets.only(bottom: 220),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(corso.immagine.toString()),
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.arrow_back_sharp),
                    Icon(Icons.more_vert),
                  ],
                ),*/
                SizedBox(height: 30),
                ClipPath(
                  clipper: BestSellerClipper(),
                  child: Container(
                    color: kBestSellerColor,
                    padding: EdgeInsets.only(
                        left: 10, top: 5, right: 20, bottom: 5),
                    child: Text(
                      "BestSeller".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(corso.titolo, style: kHeadingextStyle),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text(corso.visualizzazioni),
                    SizedBox(width: 20),
                    Icon(Icons.star),
                    SizedBox(width: 5),
                    Text(corso.valutazione)
                  ],
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${corso.prezzo} ",
                        style: kHeadingextStyle.copyWith(fontSize: 32),
                      ),
                      TextSpan(
                        text: "${corso.vecchioPrezzo}",
                        style: TextStyle(
                          color: kTextColor.withOpacity(.5),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 60, ),
        ],
      ),
    );
  }

  Widget widgetScrollabile() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.black.withOpacity(0.6),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 8.0,
            margin: EdgeInsets.only(left: 150.0, bottom: 15.0, top: 5),
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 35, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Contenuti del corso", style: kTitleTextStyle),
                //SizedBox(height: 30),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 80, 30, 70),
            child: SingleChildScrollView(
              child: Column(
                  children: contenutocorsi.map((e) => e).toList()
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 50,
                    color: kTextColor.withOpacity(.1),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(14),
                    height: 56,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFEDEE),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: MaterialButton(
                        onPressed: () {}, child: Icon(Icons.shopping_bag)),
                  ),
                  Spacer(),
                  Container(
                    height: 56,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kBlueColor,
                    ),
                    child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                            "Compra ora",
                            style: kSubtitleTextSyule.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:card_loading/card_loading.dart';
import 'package:justpet/customer/components/petshop.dart';
import 'package:justpet/global/models/medicine_help_class.dart';


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

  Widget sheetBelow=baseSliderScreen();
  SnappingSheetController controller = SnappingSheetController();
  bool changed = false;

  void changeSheet(){
    setState(() {
      sheetBelow=sliderScreen();
      if (!changed) {
        final position = positions[0];
        positions[0] = positions[1];
        positions[1] = position;
        changed=true;
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
}

Widget baseSliderScreen(){
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
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Title(color: Colors.black, child: Text('Scegli una parte del corpo per continuare', style: TextStyle(fontSize: 20),)),
          )
        ],
      ),
    ),
  );
}

Widget sliderScreen(){

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

Widget containerWithoutAnimation(bool animation, BuildContext context){
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
    child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 100.0,
            height: 8.0,
            margin: EdgeInsets.only(left: 135.0, bottom: 15.0),
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 35, 15, 15),
            child: animation ? cardLoading() : SingleChildScrollView(
              child: Column(
                children: medicines.map((medicine) => productCard(medicine, context )).toList(),
              ),
            ),
          ),
          //ListView.builder(itemBuilder: itemBuilder)
        ],
      ),
    ),
  );
}

Widget backgroundScreen ({required VoidCallback function}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
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
          bodyPartButton(icon: Icons.headphones, text: 'Comportamento', top: 10, left: 60, color: Colors.red[700], function: function),
          bodyPartButton(icon: Icons.remove_red_eye, text: 'Oculistica', top: 50, left: 60, color: Colors.blue[800], function: function),
          bodyPartButton(icon: Icons.settings_bluetooth_outlined, text: 'Odontostomatologia', top: 90, left: 20, color: Colors.pink[700], function: function),
          bodyPartButton(icon: Icons.account_tree, text: 'Algologia', top: 120, right: 100, color: Colors.orange[700], function: function),
          bodyPartButton(icon: Icons.water_drop, text: 'Dermatologia', top: 150, left: 40, color: Colors.blueAccent[700], function: function),
          bodyPartButton(icon: Icons.balance, text: 'Nefrologia', bottom: 120, right: 60, color: Colors.yellow, function: function),
          bodyPartButton(icon: Icons.confirmation_num, text: 'Gastroenterologia', color: Colors.red[700], function: function),
          bodyPartButton(icon: Icons.label_important, text: 'Ortopedia', bottom: 30, right: 30, color: Colors.green[700], function: function),
          bodyPartButton(icon: Icons.access_alarms_rounded, text: 'Urologia', bottom: 60, right: 80, color: Colors.black54, function: function),
          /*Positioned(
                  top: 10,
                  right: 10,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.headphones),
                    label: Text("Comportamento"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red[200]
                    ),
                  )),
              Positioned(
                  bottom: 10,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Button 2"),
                  ))*/
        ],
      ),
    ],
  );
}



Widget bodyPartButton({required IconData icon,required String text, double? top, double? right, double? bottom, double? left, Color? color, required VoidCallback function}){
  return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: ElevatedButton.icon(
        onPressed: () async {
          function();
        },
        icon: Container(
          padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: kTertiaryColor.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Icon(icon)
        ),
        label: Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              text,
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
              text,
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
            foregroundColor: color,
          //backgroundColor: Colors.grey.withOpacity(0.5),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
      )
  );
}

Widget cardLoading(){
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0,8.0),
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

Widget productCard(MedicineHelp medicine, BuildContext context) {
  TextStyle titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  TextStyle descriptionStyle = TextStyle(fontSize: 16);
  List<String> immagini = [
    'assets/images/dog_medicine1.jpg',
    'assets/images/dog_medicine2.jpg',
    'assets/images/dog_medicine3.jpg'
  ];

  return Padding(
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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              color: kTertiaryColor
          ),
          child: Text(medicine.titolo, style: titleStyle)),
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
          style: descriptionStyle,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 8.0),
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
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
  );
}
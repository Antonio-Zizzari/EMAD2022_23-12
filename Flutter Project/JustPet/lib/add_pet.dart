import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/utils/cupertino_picker_view_date.dart';
import 'package:justpet/utils/cupertino_picker_view_weight.dart';

class AddPet extends StatefulWidget {
  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  List<String> vaccini = [];
  List<String> allergie = [];
  List<String> intolleranze = [];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _vaccineController = TextEditingController();
  TextEditingController _intolleranceController = TextEditingController();
  TextEditingController _allergyController = TextEditingController();

  XFile? photo;
  String? _sesso, _tipoAnimale, _colore;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBar(),
      body: Form(
        key: formKey,
        child: buildBody(width, height)
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

  Widget buildBody(double width, double height){
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Text(
                  "I miei animali",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Container(
              child: photo == null ?
                ElevatedButton(
                  onPressed: () async {
                    photo = await _picker.pickImage(source: ImageSource.camera);
                    setState( () { } );
                  },
                  style: ButtonStyle(
                    side: MaterialStatePropertyAll(BorderSide(width: 3.5, color: Colors.orangeAccent)),
                    shape: MaterialStateProperty.all(CircleBorder()),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent), // <-- Button color
                    overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                      if (states.contains(MaterialState.pressed)) return Colors.orangeAccent; // <-- Splash color
                    }),
                  ),
                  child: Icon(Icons.photo_camera_outlined, size: 50),
                )
              :
                CircleAvatar(radius: 70, backgroundImage: Image.file(fit: BoxFit.cover, File(photo!.path)).image),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,5,20,5),
                child: Text(
                  "Inserisci la foto dell\'animale:",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(
                thickness: 1,
                height: 20,
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30,10,30,15),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.pets_rounded),
                  hintText: 'Bobby',
                  labelText: 'Inserisci il nome dell\'animale: ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black54
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: const CupertinoPickerViewDate(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(padding: const EdgeInsets.fromLTRB(0,8,8,8), child: Center(child: Icon(Icons.merge_type))),
                      DropdownButton<String>(
                        hint: Text("Tipo animale:"),
                        value: _tipoAnimale,
                        items: dropdownTypePets,
                        onChanged: (String? value) => setState(() {
                          _tipoAnimale = value ?? "";
                        }),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(padding: const EdgeInsets.fromLTRB(0,8,8,8), child: Center(child: Icon(Icons.transgender_outlined, size: 20,))),
                      DropdownButton<String>(
                        hint: Text("Sesso:"),
                        value: _sesso,
                        items: dropdownTypeSexs,
                        onChanged: (String? value) => setState(() {
                          _sesso = value ?? "";
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoPickerViewWeight(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(padding: const EdgeInsets.fromLTRB(0,8,8,8), child: Center(child: Icon(Icons.color_lens_outlined, size: 20,))),
                      DropdownButton<String>(
                        hint: Text("Colore:"),
                        value: _colore,
                        items: dropdownTypeColor,
                        onChanged: (String? value) => setState(() {
                          _colore = value ?? "";
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(
                thickness: 1,
                height: 20,
                color: Colors.black,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,5,20,5),
                child: Text(
                  "Inserisci lo storico medico dell\'animale:",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
              ),

            ),
            Container(
              padding: EdgeInsets.fromLTRB(20,5,20,15),
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20,10,20,10),
                  icon: IconButton(
                    iconSize: 30,
                    color: Color.fromRGBO(0,143,57, 1),
                    icon: Icon(Icons.add_circle_sharp),
                    onPressed: () {
                      setState(() {

                      });
                    },
                  ),
                  labelText: 'Inserisci i vaccini dell\'animale: ',
                  hintText: 'Vaccino ${vaccini.length + 1}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.black54
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20,5,20,15),
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20,10,20,10),
                  icon: IconButton(
                    iconSize: 30,
                    color: Color.fromRGBO(0,143,57, 1),
                    icon: Icon(Icons.add_circle_sharp),
                    onPressed: () {
                      setState(() {

                      });
                    },
                  ),
                  labelText: 'Inserisci Le intolleranxe dell\'animale: ',
                  hintText: 'Intolleranza ${intolleranze.length + 1}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.black54
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20,5,20,15),
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20,10,20,10),
                  icon: IconButton(
                    iconSize: 30,
                    color: Color.fromRGBO(0,143,57, 1),
                    icon: Icon(Icons.add_circle_sharp),
                    onPressed: () {
                      setState(() {

                      });
                    },
                  ),
                  labelText: 'Inserisci le allergie dell\'animale: ',
                  hintText: 'Allergia ${allergie.length + 1}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.black54
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(5),
              ),
              icon: Icon(Icons.fact_check_outlined),
              label: Text("AGGIUNGI ANIMALE"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
  List<DropdownMenuItem<String>> get dropdownTypePets{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Cane"),value: "Cane"),
      const DropdownMenuItem(child: Text("Gatto"),value: "Gatto"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownTypeSexs{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Maschio"),value: "Maschio"),
      const DropdownMenuItem(child: Text("Femmina"),value: "Femmina"),
    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownTypeColor{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Nero"),value: "Maschio"),
      const DropdownMenuItem(child: Text("Grigio"),value: "Grigio"),
      const DropdownMenuItem(child: Text("Grigio chiaro"),value: "Grigio chiaro"),
      const DropdownMenuItem(child: Text("Grigio scuro"),value: "Grigio scuro"),
      const DropdownMenuItem(child: Text("Bianco"),value: "Bianco"),
      const DropdownMenuItem(child: Text("Bianco sporco"),value: "Bianco sporco"),
      const DropdownMenuItem(child: Text("Marrone"),value: "Marrone"),
      const DropdownMenuItem(child: Text("Marroncino"),value: "Marroncino"),
    ];
    return menuItems;
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 500,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
  List<String> _buildCupertinoPicker(){
    return <String>[
      '2kg',
      '3kg',
      '4kg',
      '5kg',
      '6kg',
      '7kg',
      '8kg',
      '9kg',
      '10kg',
      '11kg',
      '12kg',
      '13kg',
      '14kg',
      '15kg',
      '16kg',
      '17kg',
      '18kg',
      '19kg',
      '20kg'
    ];
  }
}

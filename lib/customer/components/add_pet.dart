import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/utils/cupertino_picker_view_date.dart';
import 'package:justpet/utils/cupertino_picker_view_weight.dart';

import 'package:justpet/global/models/color.dart';

final List<CustomTextField> vaccini = [
  CustomTextField(labelHint: 'Inserisci i vaccini dell\'animale: ', hint: "Vaccini", controllers: TextEditingController(), counter: 1),
];
final List<CustomTextField> intolleranze = [
  CustomTextField(labelHint: 'Inserisci intolleranze animale: ', hint: "Intolleranze", controllers: TextEditingController(), counter: 1),
];
final List<CustomTextField> allergie = [
  CustomTextField(labelHint: 'Inserisci allergie dell\'animale: ', hint: "Allergie", controllers: TextEditingController(), counter: 1)
];

class AddPet extends StatefulWidget {
  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

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
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Aggiungi Animale",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: buildBody(width, height)
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
                  "Inserisci i dati",
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
                    side: const MaterialStatePropertyAll(BorderSide(width: 3.5, color: Colors.orangeAccent)),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent), // <-- Button color
                    overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                      if (states.contains(MaterialState.pressed)) return Colors.orangeAccent; // <-- Splash color
                    }),
                  ),
                  child: const Icon(Icons.photo_camera_outlined, size: 50),
                )
              :
                CircleAvatar(radius: 70, backgroundImage: Image.file(fit: BoxFit.cover, File(photo!.path)).image),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20,5,20,5),
                child: Text(
                  "Inserisci la foto dell\'animale:",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
              ),

            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                height: 20,
                color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30,10,30,15),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.pets_rounded),
                  hintText: 'Bobby',
                  labelText: 'Inserisci il nome dell\'animale: ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black54
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: CupertinoPickerViewDate(),
            ),
            const SizedBox(height: 20),
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
                      const Padding(padding: EdgeInsets.fromLTRB(0,8,8,8), child: Center(child: Icon(Icons.merge_type))),
                      DropdownButton<String>(
                        hint: const Text("Tipo animale:"),
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
                      const Padding(padding: EdgeInsets.fromLTRB(0,8,8,8), child: Center(child: Icon(Icons.transgender_outlined, size: 20,))),
                      DropdownButton<String>(
                        hint: const Text("Sesso:"),
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CupertinoPickerViewWeight(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(padding: EdgeInsets.fromLTRB(0,8,8,8), child: Center(child: Icon(Icons.color_lens_outlined, size: 20,))),
                      DropdownButton<String>(
                        hint: const Text("Colore:"),
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
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                height: 20,
                color: Colors.black,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20,5,20,5),
                child: Text(
                  "Inserisci lo storico medico dell\'animale:",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
              ),

            ),
            //VACCINI
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: vaccini
                  ),
                )
              ),
            ),
            //INTOLLERANZE
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                        children: intolleranze
                    ),
                  )
              ),
            ),
            //ALLERGIE
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                        children: allergie
                    ),
                  )
              ),
            ),
            ElevatedButton.icon(
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(5),
              ),
              icon: const Icon(Icons.fact_check_outlined),
              label: const Text("AGGIUNGI ANIMALE"),
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
}

class CustomTextField extends StatefulWidget {
  final String hint, labelHint;
  final TextEditingController controllers;
  final int counter;
  const CustomTextField({Key? key, required this.hint, required this.controllers, required this.counter, required this.labelHint}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20,10,20,10),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(20,10,20,10),
          icon: IconButton(
            iconSize: 30,
            color: const Color.fromRGBO(0,143,57, 1),
            icon: const Icon(Icons.add_circle_sharp),
            onPressed: () {
              setState(() {
                vaccini.add(CustomTextField(labelHint: 'Inserisci i vaccini dell\'animale: ', hint: "Vaccini", controllers: TextEditingController(), counter: vaccini.length + 1));              });
            },
          ),
          labelText: widget.labelHint,
          hintText: '${widget.hint} ${widget.counter}',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                style: BorderStyle.solid,
                color: Colors.black54
            ),
          ),
        ),
      ),
    );
  }
}

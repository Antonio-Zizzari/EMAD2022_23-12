import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:justpet/customer/screens/animal-card.dart';
import 'package:justpet/theme/color.dart';

import 'package:justpet/global/models/color.dart';

import '../models/pet_class.dart';

final List<CustomTextField> vaccini = [
  CustomTextField(labelHint: 'Inserisci vaccini animale: ', hint: "Vaccino", controllers: TextEditingController(), counter: 1, lista: 1, canDelete: false),
];
final List<CustomTextField> intolleranze = [
  CustomTextField(labelHint: 'Inserisci intolleranze animale: ', hint: "Intolleranza", controllers: TextEditingController(), counter: 1, lista: 2, canDelete: false),
];
final List<CustomTextField> allergie = [
  CustomTextField(labelHint: 'Inserisci allergie animale: ', hint: "Allergia", controllers: TextEditingController(), counter: 1, lista: 3, canDelete: false)
];

class AddPet extends StatefulWidget {
  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();

  setStateParent(){
    setState(() {});
  }


  final items = [
    '2 kg',
    '3 kg',
    '4 kg',
    '5 kg',
    '6 kg',
    '7 kg',
    '8 kg',
    '9 kg',
    '10 kg',
    '11 kg',
    '12 kg',
    '13 kg',
    '14 kg',
    '15 kg',
    '16 kg',
    '17 kg',
    '18 kg',
    '19 kg',
    '20 kg',
    '21 kg',
    '22 kg',
    '23 kg',
    '24 kg',
    '25 kg'
  ];

  XFile? photo;
  String? _sesso, _tipoAnimale, _colore;
  String peso = '2Kg';
  DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Aggiungi Animale",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SizedBox(
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
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: SizedBox(
                      width: 400,
                      height: 30,
                      child: CupertinoDatePicker(
                        maximumDate: DateTime.now().add(Duration(minutes: 1)),
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime t){
                          date=t;
                        },
                      ),
                    )
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
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: CupertinoPicker(
                        itemExtent: 35,
                        onSelectedItemChanged: (int value) {peso = value.toString();},
                        children: items.map((item) =>
                            Center(
                              child: Text(item,
                                style: TextStyle(fontSize: 24),),
                            )).toList(),
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
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Material(
                      elevation: 7,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: vaccini.map((e) =>
                              CustomTextField(
                                  labelHint: e.labelHint,
                                  hint: e.hint,
                                  controllers: e.controllers,
                                  counter: vaccini.indexOf(e) + 1,
                                  lista: e.lista,
                                  canDelete: e.canDelete,
                                  callbackToParent: setStateParent
                              )
                          ).toList(),
                        ),
                      )
                  ),
                ),
                //INTOLLERANZE
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Material(
                      elevation: 7,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: intolleranze.map((e) =>
                            CustomTextField(
                              labelHint: e.labelHint,
                              hint: e.hint,
                              controllers: e.controllers,
                              counter: intolleranze.indexOf(e) + 1,
                              lista: e.lista,
                              canDelete: e.canDelete,
                              callbackToParent: setStateParent
                            )
                          ).toList(),
                        ),
                      )
                  ),
                ),
                //ALLERGIE
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Material(
                      elevation: 7,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: allergie.map((e) =>
                            CustomTextField(
                              labelHint: e.labelHint,
                              hint: e.hint,
                              controllers: e.controllers,
                              counter: vaccini.indexOf(e) + 1,
                              lista: e.lista,
                              canDelete: e.canDelete,
                              callbackToParent: setStateParent
                            )
                          ).toList(),
                        ),
                      )
                  ),
                ),
                //BOTTONE SUBMIT
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: kPrimaryColor
                  ),
                  icon: const Icon(Icons.fact_check_outlined),
                  label: const Text("AGGIUNGI ANIMALE"),
                  onPressed: () {
                    final nome = _nameController.text.trim();
                    final data_di_nascita = date!.day.toString()+'/'+date!.month.toString()+'/'+date!.year.toString();
                    final tipo = _tipoAnimale;
                    final sesso = _sesso;
                    final colore = _colore;
                    final List<String> vaxs = List.filled(0, "", growable: true);
                    for(CustomTextField vaccino in vaccini){
                      vaxs.add(vaccino.controllers.text.trim());
                    }
                    final List<String> intoll = List.filled(0, "", growable: true);
                    for(CustomTextField intolleranza in intolleranze){
                      intoll.add(intolleranza.controllers.text.trim());
                    }
                    final List<String> aller = List.filled(0, "", growable: true);
                    for(CustomTextField allergia in allergie){
                      aller.add(allergia.controllers.text.trim());
                    }
                    final user = FirebaseAuth.instance.currentUser!;

                    if(nome.length<3){showSnackBar(Icons.warning, "Il nome deve essere lungo almeno 3 caratteri");}
                    else if(tipo == null || tipo.isEmpty){showSnackBar(Icons.warning, "È necessario inserire il tipo dell'animale");}
                    else if(sesso == null || sesso.isEmpty){showSnackBar(Icons.warning, "È necessario inserire il sesso dell'animale");}
                    else if(colore == null || colore.isEmpty){showSnackBar(Icons.warning, "È necessario inserire il colore dell'animale");}
                    else {
                      Pets pet = Pets(
                          nome: nome.replaceRange(0, 1, _nameController.text.substring(0,1).toUpperCase()),
                          eta: data_di_nascita,
                          tipoAnimale: tipo!,
                          sesso: sesso!,
                          peso: peso,
                          colore: colore!,
                          tipiVaccino: vaxs,
                          intolleranze: intoll,
                          allergie: aller,
                          pathImage: photo != null
                              ? photo!.path
                              : (tipo.contains("Cane")
                                  ? "assets/images/pet1.jpg"
                                  : "assets/images/cat1.jpg"),
                          visiteAnnuali: Map.from({}));

                      setAnimaleToFirestore(user.email!, pet);
                      showSnackBar(Icons.add_box, nome.replaceRange(0, 1, _nameController.text.substring(0,1).toUpperCase())+" aggiunto con successo!");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPets(),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSnackBar(IconData icon, String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        elevation: 25.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(
              color: kPrimaryColor,
              width: 2,
            )
        ),
        content: Row(children: [Icon(icon, color: kPrimaryColor,), SizedBox(width: 5,), Text(message, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)],
        )));
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
  final int lista;
  final Function? callbackToParent;
  final bool canDelete;
  const CustomTextField({Key? key, required this.hint, required this.controllers, required this.counter, required this.labelHint, required this.lista, required this.canDelete, this.callbackToParent}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20,10,20,10),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20,0,0,0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.delete_forever, color: Colors.white),
            ),
          )
        ),
        secondaryBackground: Container(
          color: Colors.red,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(0,0,20,0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.delete_forever, color: Colors.white),
            ),
          )
        ),
        onDismissed: (direction) {
          var mess= ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(
              backgroundColor: Colors.white,
              elevation: 25.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(
                    color: kPrimaryColor,
                    width: 2,
                  )
              ),
              content: Row(children: [
                Icon(Icons.warning,
                  color: kPrimaryColor,),
                SizedBox(width: 5,),
                Text("Non puoi eliminare l'unica riga presente!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight
                          .bold),)
              ],
              )));
          setState(() {
            if(widget.lista == 1)
              vaccini.length > 1 ? vaccini.removeAt(widget.counter-1) : mess;
            else if (widget.lista == 2)
              intolleranze.length > 1 ? intolleranze.removeAt(widget.counter-1) : mess;
            else
              allergie.length > 1 ? allergie.removeAt(widget.counter-1) : mess;
          });
          widget.callbackToParent?.call();
        },
        child: TextField(
          controller: widget.controllers,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(20,10,20,10),
            icon: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 30,
              color: const Color.fromRGBO(0,143,57, 1),
              icon: const Icon(Icons.add_circle_sharp),
              onPressed: () {
                setState(() {
                  List<CustomTextField> l;
                  if(widget.lista == 1) {
                    l = vaccini;
                  } else if (widget.lista == 2) {
                    l = intolleranze;
                  } else {
                    l = allergie;
                  }
                  if(l.length < 5) {
                    l.add(
                      CustomTextField(
                        labelHint: l[0].labelHint,
                        hint: l[0].hint,
                        controllers: TextEditingController(),
                        counter: l.indexOf(widget) + 1,
                        lista: widget.lista,
                        canDelete: true,
                        callbackToParent: widget.callbackToParent
                      )
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                        backgroundColor: Colors.white,
                        elevation: 25.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            )
                        ),
                        content: Row(children: [
                          Icon(Icons.warning,
                            color: kPrimaryColor,),
                          SizedBox(width: 5,),
                          Text("Puoi aggiungere massimo 5 righe per tipologia!",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight
                                    .bold),)
                        ],
                        )));}
                });
                widget.callbackToParent?.call();
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
      ),
    );
  }
}
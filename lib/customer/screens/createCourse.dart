import 'package:flutter/material.dart';
import 'package:justpet/global/components/appbar.dart';

class createCourse extends StatefulWidget{
  @override
  State<createCourse> createState() => _createCourseState();
}

class _createCourseState extends State<createCourse> {
  final titoloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    String categoria_selezionata="Cani";

    List<DropdownMenuItem<String>> categorie = [
      const DropdownMenuItem(child: Text("Cani"),value: "Cani"),
      const DropdownMenuItem(child: Text("Gatti"),value: "Gatti"),
      const DropdownMenuItem(child: Text("Pappagalli"),value: "Pappagalli"),
      const DropdownMenuItem(child: Text("Tartarughe"),value: "Tartarughe"),
      const DropdownMenuItem(child: Text("Criceti"),value: "Criceti"),
    ];

    return Scaffold(
      appBar: MainAppBar(_scaffoldKey),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              controller: titoloController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Inserisci il titolo del corso",
              ),
            ),
          ),
            DropdownButton<String>(
              hint: const Text("Categoria:"),
              value: categoria_selezionata,
              items: categorie,
              onChanged: (String? value) => setState(() {
                categoria_selezionata = value ?? "";
              }),
            ),
          ],
        ),
      ),
    );
  }
}
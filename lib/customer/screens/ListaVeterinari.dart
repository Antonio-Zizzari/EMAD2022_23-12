import 'package:flutter/material.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/components/CardVeterinario.dart';
import 'package:justpet/customer/components/widget/cardVeterinario.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:justpet/global/components/appbar.dart';

class ListaVeterinari extends StatefulWidget {
  const ListaVeterinari();

  @override
  State<ListaVeterinari> createState() => _ListaVeterinariState();
}

class _ListaVeterinariState extends State<ListaVeterinari> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey)/*AppBarVeterinario(
        title: 'Prenotazioni',
        showSearch: false,
      )*/,
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(
                      width: 16,
                      height: 1,
                    ),
                    Text(
                      "Cerca veterinari",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFA0A5BD),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 16.0, 0.0, 0.0),
              child: Text(
                '${veterinari.length} Veterinari',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                children: veterinari
                    .map((e) => cardVeterinario(veterinario: e))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

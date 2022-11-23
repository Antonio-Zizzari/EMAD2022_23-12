import 'package:flutter/material.dart';
import 'package:justpet/Customer/Cust_Component/Veterinario.dart';
import 'package:justpet/Customer/Cust_Component/CardVeterinario.dart';
import 'package:justpet/Customer/Cust_Component/AppBarVeterinario.dart';
import 'package:justpet/Customer/Cust_Component/SideMenu.dart';
import 'package:justpet/global_models/appbar.dart';

class ListaVeterinari extends StatefulWidget {
  const ListaVeterinari();

  @override
  State<ListaVeterinari> createState() => _ListaVeterinariState();
}

class _ListaVeterinariState extends State<ListaVeterinari> {
  final List<Veterinario> veterinari = [
    Veterinario(
        immagine: "veterinario1.jpg",
        nome: "Dottor Mario Rossi",
        indirizzo: "Via Unità Italiana, 12",
        votazione: "4,5/5,0",
        descrizione: 'Il dottor Rossi vanta più di 10 anni di esperienza nel settore, grazie alla sua competenza acquisita negli anni e coltivata con il lavoro. Ha raggiunto la vetta dopo aver operato più di 75 animali, tutti con successo',
        turni: [
          '9:00',
          '9:15',
          '9:30',
          '9:45',
          '10:00',
          '10:15',
          '10:30',
          '10:45'
        ]),
    Veterinario(
        immagine: "veterinario2.jpg",
        nome: "Dottoressa Alice Gialli",
        indirizzo: "Via Mazzini, 5",
        votazione: "4,8/5,0",
        descrizione: 'La dottoressa Gialli vanta più di 10 anni di esperienza nel settore, grazie alla sua competenza acquisita negli anni e coltivata con il lavoro. Ha raggiunto la vetta dopo aver operato più di 75 animali, tutti con successo',
        turni: ['12:30', '12:45', '13:00', '15:00', '13:30', '13:45']),
    Veterinario(
        immagine: "veterinario3.jpg",
        nome: "Dottor Giovanni Verdi",
        indirizzo: "Via Colombo, 27",
        votazione: "4,2/5,0",
        descrizione: 'Il dottor Verdi vanta più di 10 anni di esperienza nel settore, grazie alla sua competenza acquisita negli anni e coltivata con il lavoro. Ha raggiunto la vetta dopo aver operato più di 75 animali, tutti con successo',
        turni: ['16:00', '16:15', '16:30', '16:45', '17:00', '17:15']),
  ];
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
                    .map((e) => CardVeterinario(veterinario: e))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

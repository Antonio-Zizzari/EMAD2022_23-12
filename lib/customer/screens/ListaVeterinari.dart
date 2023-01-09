import 'package:firebase_auth/firebase_auth.dart';
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
  //final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {

    Veterinario initialVet = Veterinario(email: 'c',immagine: 'c', immagine_profilo: 'c', nome: 'c', indirizzo: 'c', votazione: 'c', descrizione: 'c', turni: [''], prenotazioni: ["5:00"]);
    List<Veterinario> initialData = List.filled(0, initialVet, growable: true);

    return FutureBuilder(
      future: getAllVeterinariFromFirestore(),
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot<List<Veterinario>> vets) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: MainAppBar(_scaffoldKey) /*AppBarVeterinario(
          title: 'Prenotazioni',
          showSearch: false,
        )*/,
          drawer: SideMenu(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          child: TextField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                  Icons.search, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                              hintText: "Cerca un veterinario",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.filter_list, color: Colors.black,
                            size: 30,),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 16.0, 0.0, 0.0),
                  child: Text(
                    '${vets.data!.length} Veterinari',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    children: vets.data!
                        .map((e) => cardVeterinario(veterinario: e))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

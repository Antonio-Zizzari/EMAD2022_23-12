
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:justpet/Customer/Cust_Component/Veterinario.dart';
import 'package:justpet/Customer/Cust_Component/CardVeterinario.dart';
import 'package:justpet/Customer/Cust_Component/AppBarVeterinario.dart';
import 'package:justpet/Customer/Cust_Component/SideMenu.dart';
import 'package:justpet/global_variables/colors.dart';
import 'package:justpet/global_models/appbar.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

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
  TextEditingController textController = TextEditingController();
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
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(5,5,0,5),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),

                      child: SearchBarAnimation(
                        onChanged: () {},
                        enableBoxShadow: true,
                        buttonShadowColour: kPrimaryColor,
                        durationInMilliSeconds: 350,
                        textEditingController: TextEditingController(),
                        isOriginalAnimation: true,
                        enableKeyboardFocus: true,
                        hintText: "Cerca un veterinario",
                        onExpansionComplete: () {
                          debugPrint(
                              'do something just after searchbox is opened.');
                        },
                        onCollapseComplete: () {
                          debugPrint(
                              'do something just after searchbox is closed.');
                        },
                        onPressButton: (isSearchBarOpens) {
                          debugPrint(
                              'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
                        },
                        trailingWidget: const Icon(
                          Icons.search,
                          size: 20,
                          color: kPrimaryColor,
                        ),
                        secondaryButtonWidget: const Icon(
                          Icons.close,
                          size: 20,
                          color: kPrimaryColor,
                        ),
                        buttonWidget: const Icon(
                          Icons.search,
                          size: 20,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                ),
                
                Expanded(
                  flex: 1,
                  child: Text(
                    '${veterinari.length} Risultati',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
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

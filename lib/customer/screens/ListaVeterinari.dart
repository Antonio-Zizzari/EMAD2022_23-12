import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/components/CardVeterinario.dart';
import 'package:justpet/customer/components/widget/cardVeterinario.dart';
import 'package:justpet/customer/screens/veterinarian_info.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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

    Veterinario initialVet = Veterinario(email: 'c',immagine: 'c', immagine_profilo: 'c', nome: 'c', indirizzo: 'c', votazione: 'c', descrizione: 'c', turni: [''], prenotazioni: ["5:00"], eventi: [evento]);
    List<Veterinario> initialData = List.filled(0, initialVet, growable: true);
    final TextEditingController _typeAheadController = TextEditingController();

    return FutureBuilder(
      future: getAllVeterinariFromFirestore(),
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot<List<Veterinario>> vets) {
        List<String> _getSuggestions(String query) {
          List<String> names = [];
          vets.data?.map((e) => names.add(e.nome)).toList();
          names.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
          return names;
        }

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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,10,0,0),
                        child: Icon(Icons.search, color: Colors.black, size: 30),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 50,
                          child: TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: _typeAheadController,
                              decoration: InputDecoration(labelText: "Cerca un veterinario"),
                            ),
                            minCharsForSuggestions: 1,
                            suggestionsCallback: (pattern){
                              return _getSuggestions(pattern);
                            },
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion.toString()),
                              );
                            },
                            noItemsFoundBuilder: (context) {
                              return ListTile(
                                title: Text("Nessun veterinario trovato!!"),
                              );
                            },
                            loadingBuilder: (context){
                              return CircularProgressIndicator();
                            },
                            onSuggestionSelected: (suggestion) {
                              _typeAheadController.text = suggestion.toString();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VeterinarianInfo(
                                          veterinario: vets.data!.firstWhere((element) => element.nome == suggestion)
                                      )
                                  )
                              );
                            },
                          )


                          // Autocomplete<Veterinario>(
                          //   displayStringForOption: _displayStringForOption,
                          //   optionsBuilder: (TextEditingValue textEditingValue) {
                          //     if (textEditingValue.text == '') {
                          //       return const Iterable<Veterinario>.empty();
                          //     }
                          //     return vets.data!.where((Veterinario option) {
                          //       return option
                          //           .toString()
                          //           .contains(textEditingValue.text.toLowerCase());
                          //     });
                          //   },
                          //   onSelected: (Veterinario selection){
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => VeterinarianInfo(
                          //                 veterinario: selection
                          //             )
                          //         )
                          //     );
                          //     setState(() {});
                          //   }
                          // )
                        ),
                      ),
                      SizedBox(width: 20),
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
                        .toList()
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
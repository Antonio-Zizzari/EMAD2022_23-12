import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/veterinarian/models/event_class.dart';
import 'package:justpet/veterinarian/screens/veterinarian_date.dart';

class MiePrenotazioni extends StatefulWidget {
  MiePrenotazioni({Key? key}) : super(key: key);

  @override
  State<MiePrenotazioni> createState() => _MiePrenotazioniState();
}

class _MiePrenotazioniState extends State<MiePrenotazioni> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: MainAppBar(scaffoldKey),
      drawer: SideMenu(),
      body: FutureBuilder(
        future: getAllEventiFromFirestore(user.email!, true),
        initialData: List.filled(0, evento),
        builder: (BuildContext context, AsyncSnapshot<List<Evento>> eventi) {
          if(!eventi.hasData){
            return Container();
            //caricamento
          }
          else{
            int mySortComparison(Evento a, Evento b) {
              String giornoA = a.giorno;
              String meseA = a.mese;
              String giornoB = b.giorno;
              String meseB = b.mese;

              if(giornoA.length == 1)
                giornoA = "0" + giornoA;
              if(meseA.length == 1)
                meseA = "0" + meseA;
              if(giornoB.length == 1)
                giornoB = "0" + giornoB;
              if(meseB.length == 1)
                meseB = "0" + meseB;

              String propertyA = a.anno+meseA+giornoA+a.ora+a.minuto;
              String propertyB = b.anno+meseB+giornoB+b.ora+b.minuto;
              return propertyA.compareTo(propertyB);
            } 
            eventi.data!.sort((a,b) =>mySortComparison(b,a));
            if (eventi.data!.isNotEmpty) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Le mie prenotazioni',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        children:
                            eventi.data!.map((e) => eventWidget(e)).toList(),
                      ),
                    ],
                  ),
                ),
              );
            }
            else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.highlight_remove, size: 50, color: kPrimaryColor,),
                    Text('Nessuna prenotazione effettuata',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }

  Widget eventWidget(Evento evento){
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 6.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black26
            ),
            borderRadius: BorderRadius.all(Radius.circular(25.0))

        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month, size: 50, color: kPrimaryColor,),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(evento.nome_dottore, style: TextStyle(fontSize: 18),),
                  Text(evento.giorno.toString()+'/'+evento.mese.toString()+'/'+evento.anno+' ore '+evento.ora+':'+evento.minuto, style: TextStyle(fontSize: 14),),
                  Text(DateTime.now().day <= int.parse(evento.giorno) ? "In scadenza" : "Scaduto", style: TextStyle(fontSize: 14, color: DateTime.now().day <= int.parse(evento.giorno) ? Colors.orange : Colors.red),),
                ],
              ),
              Spacer(),
              IconButton(onPressed: (){
                showAlertDialog(context, evento);
                },
                icon: Icon(Icons.delete_forever), color: kPrimaryColor,),
              SizedBox(width: 5,),
              IconButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VeterinarianDate(visita: evento),
                  ),
                );
              }, icon: Icon(Icons.arrow_forward_ios), color: kPrimaryColor,),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, Evento evento) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Annulla"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Rimuovi"),
      onPressed:  () {
        Navigator.of(context).pop();
        removeEventoFromFirestore(evento);
        setState(() {

        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Attenzione!"),
      content: Text("Sei sicuro di voler eliminare questo evento?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'Customer/Cust_Component/Veterinario.dart';
import 'package:justpet/Customer/Pages/ListaVeterinari.dart';
import 'package:justpet/Customer/Pages/Prenotazione.dart';
import 'Customer/Pages/VideoCorsi.dart';
import 'Customer/Pages/DettagliVideoCorso.dart';
import 'Customer/Cust_Component/Corso.dart';
import 'package:justpet/chat_screen/main_chat.dart';
import 'package:justpet/test.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/videocorsi',
    routes: {
      '/lista': (context) => ListaVeterinari(),
      '/prenotazioni': (context) => Prenotazione(veterinario: Veterinario(immagine: '', nome: '', indirizzo: '', votazione: '', descrizione: '', turni: [''])),
      '/videocorsi': (context) => VideoCorsi(),
      '/dettaglivideocorso': (context) => DettagliVideoCorso(corso: Corso()),
      '/chat': (context) => Chat(),
      '/dizionario_test': (context) => HomePage(corso: corsi[0]),

    },
  ));
}


/*class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Veterinario> veterinari = [
    Veterinario(
        immagine: "veterinario1.jpg",
        nome: "Dottor Mario Rossi",
        indirizzo: "Via Unità Italiana, 12",
        votazione: "4,5/5,0",
        turni: ['9:00', '9:15', '9:30', '9:45', '10:00', '10:15', '10:30', '10:45']),
    Veterinario(
        immagine: "veterinario2.jpg",
        nome: "Dottoressa Alice Gialli",
        indirizzo: "Via Mazzini, 5",
        votazione: "4,8/5,0",
        turni: ['12:30', '12:45', '13:00', '15:00', '13:30', '13:45']),
    Veterinario(
        immagine: "veterinario3.jpg",
        nome: "Dottor Giovanni Verdi",
        indirizzo: "Via Colombo, 27",
        votazione: "4,2/5,0",
        turni: ['16:00', '16:15', '16:30', '16:45', '17:00', '17:15']),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarVeterinario(title: '', showSearch: false,),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '3 Veterinari',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: veterinari
                  .map((e) => CardVeterinario(veterinario: e))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
*/
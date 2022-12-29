import 'package:flutter/material.dart';
import 'package:justpet/customer/components/petshop.dart';
import 'package:justpet/customer/screens/animal-card.dart';
import 'package:justpet/customer/screens/favorite_dogs_race_screen.dart';
import 'package:justpet/veterinarian/screens/dizionario_screen.dart';
import 'package:justpet/veterinarian/screens/prenotazioni_screen.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/screens/ListaVeterinari.dart';
import 'package:justpet/customer/screens/Prenotazione.dart';
import 'package:justpet/customer/screens/VideoCorsi.dart';
import 'package:justpet/global/screens/main_chat.dart';
import 'package:justpet/global/screens/welcome_page.dart';
import 'package:justpet/global/screens/login_page.dart';
import 'package:justpet/global/screens/register_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/welcome',
    routes: {
      '/lista': (context) => ListaVeterinari(),
      '/prenotazioni': (context) => Prenotazione(veterinario: Veterinario(immagine: '', nome: '', indirizzo: '', votazione: '', descrizione: '', turni: [''])),
      '/videocorsi': (context) => VideoCorsi(),
      '/petshop': (context) => PetShop(),
      '/chat': (context) => Chat(),
      '/turni_lavoro': (context) => TurniLavoro(),
      '/dizionario' : (context) => DizionarioScreen(),
      '/scheda_animali' : (context) => MyPets(),
      '/welcome' : (context) => Welcome(),
      '/trova-animale' : (context) => FavoriteDogsRace(),
      '/login' : (context) => Login(),
      '/register' : (context) => Register(),
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
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:justpet/customer/models/cliente.dart';
import 'package:justpet/customer/models/visit_class.dart';
import 'package:collection/collection.dart';
import 'package:justpet/veterinarian/models/event_class.dart';

class Pets{
  final String nome, tipoAnimale, sesso, colore, eta, peso, pathImage;
  List<String>? tipiVaccino;
  List<String>? allergie;
  List<String>? intolleranze;
  Map<String, Map<String, List<dynamic>>> visiteAnnuali;

  Pets({
    required this.nome,
    required this.tipoAnimale,
    required this.colore,
    required this.sesso,
    required this.eta,
    required this.peso,
    required this.pathImage,
    required this.tipiVaccino,
    required this.allergie,
    required this.intolleranze,
    required this.visiteAnnuali
  });

  factory Pets.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();

    /*
      PROBLEMI ATTUALI:
        - ogni nuovo animale inserito sostituisc il precedente, in quanto il nome del doc è lo stesso
        - bisogna calcolare le visite annuali all'inverso nel metodo fromFirestore
    */
    Map<String, List<dynamic>> mapp = new Map();
    Map<String, Map<String, List<dynamic>>> mappp=new Map();



    (data?['visiteAnnuali'] as Map<String, dynamic>).forEach((key, value) {
      (value as Map<String, dynamic>).forEach((key, value) {
        //print(value);
        //print(value.runtimeType);
        mapp[key] = value;
      });
      mappp[key]=mapp;
    });


    return Pets(
      nome: data?['nome'],
      tipoAnimale: data?['tipoAnimale'],
      colore: data?['colore'],
      sesso: data?['sesso'],
      eta: data?['eta'],
      peso: data?['peso'],
      pathImage: data?['pathImage'],
      tipiVaccino:
        data?['tipiVaccino'] is Iterable ? List.from(data?['tipiVaccino']) : null,
      allergie:
        data?['allergie'] is Iterable ? List.from(data?['allergie']) : null,
      intolleranze:
        data?['intolleranze'] is Iterable ? List.from(data?['intolleranze']) : null,
      visiteAnnuali: mappp,
      //Map<int, Map<int, List<VisitClass>>> visiteAnnuali;
    );
  }

  Map<String, dynamic> toFirestore() {
    visiteAnnuali.forEach(
      (key, value) {
        value.forEach((key, value) {
          for (int i = 0; i < value.length; i++){
            value[i] = (value[i].toFirestore());
          }
        });
      }
    );

    return {
      if (nome != null) "nome": nome,
      if (tipoAnimale != null) "tipoAnimale": tipoAnimale,
      if (colore != null) "colore": colore,
      if (sesso != null) "sesso": sesso,
      if (eta != null) "eta": eta,
      if (peso != null) "peso": peso,
      if (pathImage != null) "pathImage": pathImage,
      if (tipiVaccino != null) "tipiVaccino": tipiVaccino,
      if (allergie != null) "allergie": allergie,
      if (intolleranze != null) "intolleranze": intolleranze,
      if (visiteAnnuali != null) "visiteAnnuali": visiteAnnuali
    };
  }



  void addVaccino(String vaccino){
    tipiVaccino?.add(vaccino);
  }
  void addAllergie(String allergia){
    allergie?.add(allergia);
  }
  void addIntolleranze(String intolleranza){
    intolleranze?.add(intolleranza);
  }
}

void setAnimaleToFirestore(String email, Pets pet) async{
  final docRef = FirebaseFirestore.instance
      .collection("Animale")
      .doc(email)
      .collection("Animali")
      .withConverter(
    fromFirestore: Pets.fromFirestore,
    toFirestore: (Pets animali, options) => animali.toFirestore(),
  )
      .doc(pet.nome);
  await docRef.set(pet);
}


void updateAnimaleOnFirestore(Pets animale, Evento evento) async{
  /*final washingtonRef = db.collection("cites").doc("DC");
washingtonRef.update({"capital": true}).then(
    (value) => print("DocumentSnapshot successfully updated!"),
    onError: (e) => print("Error updating document $e"));*/

  if(animale.visiteAnnuali[evento.anno.toString()] != null && animale.visiteAnnuali[evento.anno.toString()]![evento.mese.toString()] !=null) {
    animale.visiteAnnuali[evento.anno.toString()]![evento.mese.toString()]!.add(
        evento.toFirestore());
  }
  else {
    if(animale.visiteAnnuali[evento.anno.toString()] == null) {
      Map<String, Map<String, List<dynamic>>> eventi_annuali = {
        evento.anno.toString(): {}
      };
      animale.visiteAnnuali.addEntries(eventi_annuali.entries);
    }
    Map<String, List<dynamic>> eventi_mensili = {
      evento.mese.toString(): [evento.toFirestore()]
    };
    animale.visiteAnnuali[evento.anno.toString()]!.addEntries(eventi_mensili.entries);
  }
  final docRef = FirebaseFirestore.instance
      .collection("Animale")
  .doc(evento.email_cliente)
  .collection("Animali")
      .withConverter(
    fromFirestore: Pets.fromFirestore,
    toFirestore: (Pets animale, options) => animale.toFirestore(),
  )
      .doc(animale.nome);
  await docRef.update({"visiteAnnuali": animale.visiteAnnuali}).then(
          (value) => print("Prenotazione aggiunta con successo"),
      );
}


Future<List<Pets>> getAllAnimaliFromFirestore(String email) async{
  final List<Pets> lista = [];
  final ref = FirebaseFirestore.instance.collection("Animale").doc(email).collection("Animali").withConverter(
    fromFirestore: Pets.fromFirestore,
    toFirestore: (Pets animale, _) => animale.toFirestore(),
  );
  final docSnap = await ref.get();
  docSnap.docs.forEach((element) {lista.add(element.data());});
  return lista;
}

Future<Pets> getAnimaleFromFirestore(String email, String nome) async{
  final ref = FirebaseFirestore.instance.collection("Animale").doc(email).collection("Animali").doc(nome).withConverter(
    fromFirestore: Pets.fromFirestore,
    toFirestore: (Pets animale, _) => animale.toFirestore(),
  );
  final docSnap = await ref.get();
  final animale = docSnap.data(); // Convert to Animale object
  if (animale != null) {
    return animale;
  } else {
    return Pets(nome: 'errore', tipoAnimale: 'errore', colore: 'errore', sesso: 'errore', eta: 'errore', peso: 'errore', pathImage: 'errore', tipiVaccino: [], intolleranze: [], allergie: [], visiteAnnuali: {}
    );
  }
}

Future<bool> removeAnimaleFromFirestore(String email, Pets animale) async{
  bool t=false;
  final ref = FirebaseFirestore.instance.collection("Animale").doc(email).collection("Animali").doc(animale.nome).withConverter(
    fromFirestore: Pets.fromFirestore,
    toFirestore: (Pets animale, _) => animale.toFirestore(),
  );
  await ref.delete().then((value) => t=true).onError((error, stackTrace) => t=false);
  return t;
}


String descrizione = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

List<Pets> pets = [
  Pets(
    nome: "Teddy",
    tipoAnimale: "Cane",
    colore: "Nero",
    sesso: "Maschio",
    eta: "5 Mesi",
    peso: "13 kg",
    pathImage: "assets/images/pet1.jpg",
    tipiVaccino: ["Bordetella", "Influenza"],
    allergie: [],
    intolleranze: ["Latticini"],
    visiteAnnuali: {
      '2021': {
        '3': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2021, 3, 03, 9, 00)),
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2021, 3, 03, 17)
          ),
        ],
        '6': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2021, 6, 12, 16)
          ),
        ],
        '9': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2021, 9, 24, 10)
          ),
        ],
      },
      '2022': {
        '2': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 2, 13)
          ),
        ],
        '5': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 5, 01, 12)
          ),
        ],
        '7': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 7, 02, 10)
          ),
        ],
        '11': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 11, 08, 12)
          ),
        ],
      }
    }
  ),
  Pets(
    nome: "Sly",
    tipoAnimale: "Cane",
    colore: "Marrone",
    sesso: "Femmina",
    eta: "6 Mesi",
    peso: "8 kg",
    pathImage: "assets/images/pet2.jpg",
    tipiVaccino: ["Influenza"],
    allergie: ["Dermatite Cronica"],
    intolleranze: ["Glutine"],
    visiteAnnuali: {
      '2022': {
        '1': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 1, 11, 9, 30)
          ),
        ],
        '2': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 2, 26, 11, 30)
          ),
        ],
        '8': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 8, 02, 12)
          ),
        ],
        '10': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 10, 28, 14, 30)
          ),
        ],
      }
    }
  ),
  Pets(
    nome: "Bobby",
    tipoAnimale: "Cane",
    colore: "Marroncino",
    sesso: "Femmina",
    eta: "4 Mesi",
    peso: "15 kg",
    pathImage: "assets/images/pet3.jpg",
    tipiVaccino: ["Anti-Influenzale"],
    allergie: ["Dermatite", "Rinite Allergica"],
    intolleranze: [],
    visiteAnnuali: {
      '2022': {
        '1': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 1, 12, 11)
          ),
        ],
        '2': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 2, 13, 12, 30)
          ),
        ],
        '5': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 5, 14, 14, 45)
          ),
        ],
        '10': [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: descrizione,
            data: DateTime.utc(2022, 10, 07, 13)
          ),
        ],
      }
    }
  ),
];

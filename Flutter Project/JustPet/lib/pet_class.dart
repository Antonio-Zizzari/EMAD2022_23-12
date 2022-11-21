import 'package:justpet/visit_class.dart';

class Pets{
  final String nome, tipoAnimale, sesso, colore, eta, peso, pathImage;
  List<String> tipiVaccino = ["ooo","SSS", "OOO", "Ooo", "Ooo", "Ooo", "Ooo"];
  List<String> allergie = ["ooo", "OOO", "Ooo", "SSS", "Ooo", "Ooo", "Ooo"];
  List<String> intolleranze = ["ooo", "Ooo","SSS", "OOO",  "Ooo", "Ooo", "Ooo"];
  List<VisitClass> visiteAnimale = [
    VisitClass(
        orarioVisita: '09:00',
        giornoVisita: '28',
        meseVisita: '04',
        annoVisita: '2022',
        nomeVeterinario: 'Dott. Mario Rossi'),
    VisitClass(
        orarioVisita: '15:00',
        giornoVisita: '30',
        meseVisita: '10',
        annoVisita: '2022',
        nomeVeterinario: 'Dott. Mario Rossi'),
    VisitClass(
        orarioVisita: '16:00',
        giornoVisita: '07',
        meseVisita: '10',
        annoVisita: '2022',
        nomeVeterinario: 'Dott. Mario Rossi'),
    VisitClass(
        orarioVisita: '14:30',
        giornoVisita: '20',
        meseVisita: '11',
        annoVisita: '2022',
        nomeVeterinario: 'Dott. Mario Rossi'),
  ];

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
    required this.visiteAnimale
  });

  void addVaccino(String vaccino){
    tipiVaccino.add(vaccino);
  }
  void addAllergie(String allergia){
    allergie.add(allergia);
  }
  void addIntolleranze(String intolleranza){
    intolleranze.add(intolleranza);
  }
}

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
      visiteAnimale: [
        VisitClass(
          orarioVisita: '09:00',
          giornoVisita: '28',
          meseVisita: '04',
          annoVisita: '2022',
          nomeVeterinario: 'Dott. Mario Rossi'),
        VisitClass(
            orarioVisita: '15:00',
            giornoVisita: '30',
            meseVisita: '10',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
        VisitClass(
            orarioVisita: '16:00',
            giornoVisita: '07',
            meseVisita: '10',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
        VisitClass(
            orarioVisita: '14:30',
            giornoVisita: '20',
            meseVisita: '11',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
      ]
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
      visiteAnimale: [
        VisitClass(
            orarioVisita: '09:00',
            giornoVisita: '28',
            meseVisita: '04',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
        VisitClass(
            orarioVisita: '15:00',
            giornoVisita: '30',
            meseVisita: '10',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
        VisitClass(
            orarioVisita: '16:00',
            giornoVisita: '07',
            meseVisita: '10',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
        VisitClass(
            orarioVisita: '14:30',
            giornoVisita: '20',
            meseVisita: '11',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
      ]
  ),
  Pets(nome: "Bobby",
      tipoAnimale: "Cane",
      colore: "Marroncino",
      sesso: "Femmina",
      eta: "4 Mesi",
      peso: "15 kg",
      pathImage: "assets/images/pet3.jpg",
      tipiVaccino: ["Anti-Influenzale"],
      allergie: ["Dermatite", "Rinite Allergica"],
      intolleranze: [],
      visiteAnimale: [
        VisitClass(
            orarioVisita: '09:00',
            giornoVisita: '28',
            meseVisita: '04',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
        VisitClass(
            orarioVisita: '15:00',
            giornoVisita: '30',
            meseVisita: '10',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
        VisitClass(
            orarioVisita: '16:00',
            giornoVisita: '07',
            meseVisita: '10',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
        VisitClass(
            orarioVisita: '14:30',
            giornoVisita: '20',
            meseVisita: '11',
            annoVisita: '2022',
            nomeVeterinario: 'Dott. Mario Rossi'),
      ]
  ),
];

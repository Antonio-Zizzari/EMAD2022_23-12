import 'package:justpet/customer/models/visit_class.dart';

class Pets{
  final String nome, tipoAnimale, sesso, colore, eta, peso, pathImage;
  List<String> tipiVaccino;
  List<String> allergie;
  List<String> intolleranze;
  Map<int, Map<int, List<VisitClass>>> visiteAnnuali;

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
    visiteAnnuali: {
      2021: {
        3: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2021, 3, 03, 9, 00)),
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2021, 3, 03, 17)
          ),
        ],
        6: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2021, 6, 12, 16)
          ),
        ],
        9: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2021, 9, 24, 10)
          ),
        ],
      },
      2022: {
        2: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 2, 13)
          ),
        ],
        5: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 5, 01, 12)
          ),
        ],
        7: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 7, 02, 10)
          ),
        ],
        11: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
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
      2022: {
        1: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 1, 11, 9, 30)
          ),
        ],
        2: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 2, 26, 11, 30)
          ),
        ],
        8: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 8, 02, 12)
          ),
        ],
        10: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
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
      2022: {
        1: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 1, 12, 11)
          ),
        ],
        2: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 2, 13, 12, 30)
          ),
        ],
        5: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 5, 14, 14, 45)
          ),
        ],
        10: [
          VisitClass(
            nomeVeterinario: 'Dott. Mario Rossi',
            descrizione: "Descrizione Prova",
            data: DateTime.utc(2022, 10, 07, 13)
          ),
        ],
      }
    }
  ),
];

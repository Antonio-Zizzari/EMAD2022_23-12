import 'package:flutter/material.dart';

class MedicineHelp {
  final immagine;
  final String titolo;
  final descrizione;

  MedicineHelp({
    this.immagine,
    this.titolo = '',
    this.descrizione = '',
  });
}

List<MedicineHelp> medicines = [
  MedicineHelp(titolo: 'Frontline Combo', descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/dog_medicine1.jpg'),
  MedicineHelp(titolo: 'Panacur', descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/dog_medicine2.jpg'),
  MedicineHelp(titolo: 'Caspongil', descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/dog_medicine3.jpg'),
];
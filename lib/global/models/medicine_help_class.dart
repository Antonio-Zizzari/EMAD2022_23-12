import 'package:flutter/material.dart';

class MedicineHelp {
  final immagine;
  final String titolo;
  final descrizione;
  final animale;
  final categorie;

  MedicineHelp({
    this.immagine,
    this.titolo = '',
    this.descrizione = '',
    this.animale='',
    this.categorie='',
  });
}

List<MedicineHelp> medicines = [
  MedicineHelp(titolo: 'Senilife® Plus', animale: "multi", categorie: "Comportamento", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/senilifeplus.jpg'),
  MedicineHelp(titolo: 'Oculvet® Gocce', animale: "multi", categorie: "Oculistica", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/oculvetgocce.jpg'),
  MedicineHelp(titolo: 'Oculvet® Salviettine', animale: "multi", categorie: "Oculistica", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/oculvetsalviettine.jpg'),
  MedicineHelp(titolo: 'Restomyl® Dentalbones', animale: "multi", categorie: "Odontomastologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/restomyldentalbones.jpg'),
  MedicineHelp(titolo: 'Restomyl® Dentalcroc', animale: "multi", categorie: "Odontomastologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/restomyldentalcroc.jpg'),
  MedicineHelp(titolo: 'Restomyl® Dentifricio', animale: "multi", categorie: "Odontomastologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/restomyldentifricio.jpg'),
  MedicineHelp(titolo: 'Restomyl® Gel', animale: "multi", categorie: "Odontomastologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/restomylgel.jpg'),
  MedicineHelp(titolo: 'Restomyl® Supplemento', animale: "multi", categorie: "Odontomastologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/restomylsupplemento.jpg'),
  MedicineHelp(titolo: 'Alevica®', animale: "multi", categorie: "Algologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/alevica.jpg'),
  MedicineHelp(titolo: 'Alevica® Liquid', animale: "multi", categorie: "Algologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/alevicaliquid.jpg'),
  MedicineHelp(titolo: 'Retopix® Mousse', animale: "multi", categorie: "Dermatologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/retopixmousse.jpg'),
  MedicineHelp(titolo: 'Repy® Dress', animale: "multi", categorie: "Dermatologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/repydress.jpg'),
  MedicineHelp(titolo: 'Repy® Gel', animale: "multi", categorie: "Dermatologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/repygel.jpg'),
  MedicineHelp(titolo: 'Redonyl® Ultra', animale: "multi", categorie: "Dermatologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/redonylultra.jpg'),
  MedicineHelp(titolo: 'Urys® Caps', animale: "multi", categorie: "Nefrologia Urologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/urys.jpg'),
  MedicineHelp(titolo: 'Urys® Liquid', animale: "multi", categorie: "Nefrologia Urologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/urysliquid.jpg'),
  MedicineHelp(titolo: 'Nefrys®', animale: "multi", categorie: "Nefrologia Urologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/nefrys.jpg'),
  MedicineHelp(titolo: 'Normalia® Fast', animale: "multi", categorie: "Gastroenterologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/normaliafast.jpg'),
  MedicineHelp(titolo: 'Normalia® Extra Stick', animale: "gatto", categorie: "Gastroenterologia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/normalia.jpg'),
  MedicineHelp(titolo: 'Glupacur® Compresse', animale: "multi", categorie: "Ortopedia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/glupacurcompresse.jpg'),
  MedicineHelp(titolo: 'Condrostress® Cat', animale: "gatto", categorie: "Ortopedia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/condrostresscat.jpg'),
  MedicineHelp(titolo: 'Condrogen® Energy', animale: "gatto", categorie: "Ortopedia", descrizione: "Medicina usata per la cura dell'animale in tutto e per tutto", immagine: 'assets/images/medicines/condrogenenergy.jpg'),

];
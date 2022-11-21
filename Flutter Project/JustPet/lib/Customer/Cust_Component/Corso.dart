import 'package:justpet/Customer/Cust_Component/ContenutoCorso.dart';

class Corso {
  final String titolo;
  final immagine;
  final numeroCorsi;
  final vecchioPrezzo;
  final prezzo;
  final visualizzazioni;
  final valutazione;
  final List<ContenutoCorso>? contenutoCorso;

  Corso({
    this.titolo = '',
    this.immagine,
    this.numeroCorsi,
    this.vecchioPrezzo,
    this.prezzo,
    this.visualizzazioni,
    this.valutazione,
    this.contenutoCorso,
  });
}

List<Corso> corsi=[
  Corso(titolo: 'Cani', immagine: "assets/dog.jpg", numeroCorsi: 25, vecchioPrezzo: '70', prezzo: '50', visualizzazioni: '18k', valutazione: '4.8', contenutoCorso: contenutocorsi),
  Corso(titolo: 'Gatti', immagine: "assets/cat.jpg", numeroCorsi: 17, vecchioPrezzo: '70', prezzo: '50', visualizzazioni: '18k', valutazione: '4.8', contenutoCorso: contenutocorsi),
  Corso(titolo: 'Pappagalli', immagine: "assets/parrot.jpg", numeroCorsi: 13, vecchioPrezzo: '70', prezzo: '50', visualizzazioni: '18k', valutazione: '4.8', contenutoCorso: contenutocorsi),
  Corso(titolo: 'Lupi', immagine: "assets/dog.jpg", numeroCorsi: 5, vecchioPrezzo: '70', prezzo: '50', visualizzazioni: '18k', valutazione: '4.8', contenutoCorso: contenutocorsi),
];
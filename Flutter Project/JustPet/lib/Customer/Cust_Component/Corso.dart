
import 'package:justpet/Customer/Cust_Component/ContenutoCorso.dart';

class Corso{
  final String titolo;
  final immagine;
  final categoria;
  final numeroVideo;
  final vecchioPrezzo;
  final prezzo;
  final visualizzazioni;
  final valutazione;

  Corso({
    this.titolo = '',
    this.immagine,
    this.categoria,
    this.numeroVideo,
    this.vecchioPrezzo,
    this.prezzo,
    this.visualizzazioni,
    this.valutazione,
  });
}

List<Corso> corsi=[
  //Cani
  Corso(titolo: 'Come lavare il proprio cane 1', immagine: "assets/dog.jpg", categoria: 'Cani', numeroVideo: 5, vecchioPrezzo: '70€', prezzo: '50€', visualizzazioni: '18k', valutazione: '4.8'),
  Corso(titolo: 'Come lavare il proprio cane 2', immagine: "assets/dog2.jpg", categoria: 'Cani', numeroVideo: 7, vecchioPrezzo: '120€', prezzo: '75€', visualizzazioni: '1k', valutazione: '4.5'),
  Corso(titolo: 'Come lavare il proprio cane 3', immagine: "assets/dog3.jpg", categoria: 'Cani', numeroVideo: 12, vecchioPrezzo: '155€', prezzo: '135€', visualizzazioni: '29k', valutazione: '4.2'),
  Corso(titolo: 'Come lavare il proprio cane 4', immagine: "assets/dog4.jpg", categoria: 'Cani', numeroVideo: 3, vecchioPrezzo: '35€', prezzo: 'Gratis', visualizzazioni: '7k', valutazione: '4.9'),
  //Gatti
  Corso(titolo: 'Come lavare il proprio gatto', immagine: "assets/cat.jpg", categoria: 'Gatti', numeroVideo: 10, vecchioPrezzo: '70€', prezzo: '50€', visualizzazioni: '18k', valutazione: '4.8'),
  Corso(titolo: 'Come lavare il proprio gatto', immagine: "assets/cat.jpg", categoria: 'Gatti', numeroVideo: 10, vecchioPrezzo: '70€', prezzo: '50€', visualizzazioni: '18k', valutazione: '4.8'),
  //Pappagalli
  Corso(titolo: 'Come lavare il proprio pappagallo', immagine: "assets/parrot.jpg", categoria: 'Pappagalli', numeroVideo: 10, vecchioPrezzo: '70€', prezzo: '50€', visualizzazioni: '18k', valutazione: '4.8'),
  //Lupi
  Corso(titolo: 'Come lavare il proprio lupo', immagine: "assets/dog.jpg", categoria: 'Lupi', numeroVideo: 10, vecchioPrezzo: '70€', prezzo: '50€', visualizzazioni: '18k', valutazione: '4.8'),];
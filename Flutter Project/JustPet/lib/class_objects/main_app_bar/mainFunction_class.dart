import 'package:flutter/material.dart';

class FunzioniMain {
  final String titolo;
  final colore;
  final icona;
  final nextRoute;


  FunzioniMain({
    this.titolo = '',
    this.colore = const Color(0xFFFFCDD2),
    this.icona = Icons.disabled_by_default_outlined,
    this.nextRoute = '',
    });
}

class FunzioniSecondarie {
  final String titolo;
  final String nextRoute;


  FunzioniSecondarie({
    this.titolo = '',
    this.nextRoute = '',
  });
}

List<FunzioniMain> funzioniPrincipali = [
  FunzioniMain(titolo: 'Scheda animali', icona: Icons.pets, nextRoute: '/lista'),
  FunzioniMain(titolo: 'Cerca veterinari', icona: Icons.search_sharp, nextRoute: '/lista'),
  FunzioniMain(titolo: 'Video corsi', icona: Icons.video_collection, nextRoute: '/videocorsi'),
  FunzioniMain(titolo: 'Acquista prodotti', icona: Icons.shopping_bag, nextRoute: '/lista'),
  FunzioniMain(titolo: 'Comunicazioni', icona: Icons.chat, nextRoute: '/chat'),
  FunzioniMain(titolo: 'Turni Lavoro', icona: Icons.work, nextRoute: '/turni_lavoro'),
  FunzioniMain(titolo: 'Dizionario', icona: Icons.medical_information, nextRoute: '/dizionario'),

];

/*List<FunzioniSecondarie> funzioniSecondarie = [
  FunzioniSecondarie(titolo: 'Scheda animali', nextRoute: '/lista'),
  FunzioniSecondarie(titolo: 'Cerca veterinari', nextRoute: '/lista'),
  FunzioniSecondarie(titolo: 'Video corsi', nextRoute: '/videocorsi'),
  FunzioniSecondarie(titolo: 'Acquista prodotti', nextRoute: '/lista'),
];
*/

//const Color(0xFF05780C)
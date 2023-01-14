
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/models/cliente.dart';

class Utente{
  String email;


  Utente({required this.email});

  factory Utente.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Utente(
      email: data?['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "email": email,
    };
  }
}

void setUtenteToFirestore(Utente utente) async{
  if(utente.runtimeType.toString()=='Cliente') {
    setClienteToFirestore(utente as Cliente);
  }
  else if(utente.runtimeType.toString()=='Veterinario') {
    setVeterinarioToFirestore(utente as Veterinario);
  }
}

Future<Utente> getUtenteFromFirestore(String email, String tipoUtente) async{
  if(tipoUtente=="Cliente"){
    return getClienteFromFirestore(email);
  }
  else{
    return getVeterinarioFromFirestore(email);
  }
}

Future<Utente> getClienteOrVeterinarioFromFirestore(String email) async{

  late Cliente cliente;
  late Veterinario veterinario;

  await getClienteFromFirestore(email).then((value) => cliente = value);
  await getVeterinarioFromFirestore(email).then((value) => veterinario=value);

  if(cliente!=null && cliente.email!="errore"){
    return cliente;
  }
  if(veterinario!=null && veterinario.email!="errore"){
    return veterinario;
  }
  return Utente(email: "errore");
}


Veterinario veterinario_filler = Veterinario(
  email: "errore",
  immagine: "errore",
  immagine_profilo: "errore",
  nome: "errore",
  indirizzo: "errore",
  votazione: "errore",
  descrizione: "errore",
  turni:List.filled(0, "errore"),
  prenotazioni: List.filled(0, "errore"),
  eventi: List.filled(0, evento),
);
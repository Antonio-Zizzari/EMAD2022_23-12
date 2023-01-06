import 'package:cloud_firestore/cloud_firestore.dart';

class VisitClass {
  final String nomeVeterinario, descrizione;
  final DateTime data;

  VisitClass({
    required this.data,
    required this.nomeVeterinario,
    required this.descrizione
  });

  factory VisitClass.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return VisitClass(
      data: data?['data'],
      nomeVeterinario: data?['nomeVeterinario'],
      descrizione: data?['descrizione'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (data != null) "nome": data.toString(),
      if (nomeVeterinario != null) "tipoAnimale": nomeVeterinario,
      if (descrizione != null) "colore": descrizione,
    };
  }
}
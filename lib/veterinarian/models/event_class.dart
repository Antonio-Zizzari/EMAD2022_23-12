import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/models/cliente.dart';

enum TipoOperazione { operazione, visita }

class Evento extends Object{

  String nome_cliente = '', email_cliente = '', nome_dottore = '', email_dottore= '', nome_animale='', razza_animale = '';
  String mese= "1",giorno= "1",anno ="2022", ora="00", minuto="00";
  String tipoOperazione ="visita";
  String durata  = '15m';

  Evento(
  {
    required this.nome_cliente, required this.nome_dottore, required this.email_cliente, required this.email_dottore, required this.nome_animale,  required this.razza_animale, required this.anno, required this.mese, required this.giorno, required this.ora, required this.minuto, required this.tipoOperazione

  });

  factory Evento.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Evento(
      nome_cliente: data?['nome_cliente'],
      nome_dottore: data?['nome_dottore'],
      email_cliente: data?['email_cliente'],
      email_dottore: data?['email_dottore'],
      nome_animale: data?['nome_animale'],
      razza_animale: data?['razza_animale'],
      anno: data?['anno'],
      mese: data?['mese'],
      giorno: data?['giorno'],
      ora: data?['ora'],
      minuto: data?['minuto'],
      tipoOperazione: data?['tipoOperazione'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "nome_cliente": nome_cliente,
      "nome_dottore": nome_dottore,
      "email_cliente": email_cliente,
      "email_dottore": email_dottore,
      "nome_animale" : nome_animale,
      "razza_animale": razza_animale,
      "anno": anno,
      "mese": mese,
      "giorno": giorno,
      "ora": ora,
      "minuto": minuto,
      "tipoOperazione": tipoOperazione,
    };
  }

  Map<String, dynamic> toJson() => {
    "nome_cliente": nome_cliente,
    "nome_dottore": nome_dottore,
    "email_cliente": email_cliente,
    "email_dottore": email_dottore,
    "nome_animale" : nome_animale,
    "razza_animale": razza_animale,
    "anno": anno,
    "mese": mese,
    "giorno": giorno,
    "ora": ora,
    "minuto": minuto,
    "tipoOperazione": tipoOperazione,
  };

  static Evento fromJson(Map<String, dynamic> json) => Evento(
    nome_cliente: json['nome_cliente'],
    nome_dottore: json['nome_dottore'],
    email_cliente: json['email_cliente'],
    email_dottore: json['email_dottore'],
    nome_animale: json['nome_animale'],
    razza_animale: json['razza_animale'],
    anno: json['anno'],
    mese: json['mese'],
    giorno: json['giorno'],
    ora: json['ora'],
    minuto: json['minuto'],
    tipoOperazione: json['tipoOperazione'],
  );


}


void setEventoToFirestore(Evento evento) async{
  late Veterinario vet;
  await getVeterinarioFromFirestore(evento.email_dottore).then((value) => vet=value);
  dynamic eventiVet= vet.eventi;
  if (eventiVet != null) {
    eventiVet!.add(evento);
  }
  else{
    eventiVet=List.generate(1, (index) => evento);
  }

  late Cliente cl;
  await getClienteFromFirestore(evento.email_cliente).then((value) => cl=value);
  List<Evento>? eventiCl= cl.eventi;
  if(eventiCl!= null){
    eventiCl!.add(evento);
  }
  else{
    eventiCl=List.generate(1, (index) => evento);
  }

  
  final docRef = FirebaseFirestore.instance
      .collection("Veterinario").doc(vet.email).collection("Eventi")
      .withConverter(
    fromFirestore: Evento.fromFirestore,
    toFirestore: (Evento evento, options) => evento.toFirestore(),
  )
      .doc(evento.anno+evento.mese+evento.giorno+evento.ora+evento.minuto);
  await docRef.set(evento).then(
          (value) => print("Prenotazione aggiunta con successo al veterinario"),
      onError: (e) => print("Errore nell'aggiornamento del documento $e"));


  await FirebaseFirestore.instance
      .collection("Cliente").doc(cl.email).collection("Eventi")
      .withConverter(
    fromFirestore: Evento.fromFirestore,
    toFirestore: (Evento cliente, options) => evento.toFirestore(),
  )
      .doc(evento.anno+evento.mese+evento.giorno+evento.ora+evento.minuto).set(evento).then((value) => print('Evento aggiunto al cliente'));
}

Future<List<Evento>> getAllEventiFromFirestore(String email, bool isCliente) async{
  List<Evento> lista = List.filled(0, Evento(
    nome_cliente: "Errore",
    nome_dottore: "Errore",
    email_cliente: "",
    email_dottore: "",
    nome_animale: "",
    razza_animale: "",
    anno: "",
    mese: "",
    giorno: "",
    ora: "",
    minuto: "",
    tipoOperazione: "visita",
  ), growable: true);

  if(isCliente){
    final res = await FirebaseFirestore.instance.collection("Cliente").doc(email).collection("Eventi").withConverter(
      fromFirestore: Evento.fromFirestore,
      toFirestore: (Evento evento, _) => evento.toFirestore(),
    ).get();
    res.docs.forEach((element) {lista.add(element.data());});
    return lista;
  }
  else{
    final res = await FirebaseFirestore.instance.collection("Veterinario").doc(email).collection("Eventi").withConverter(
      fromFirestore: Evento.fromFirestore,
      toFirestore: (Evento evento, _) => evento.toFirestore(),
    ).get();
    res.docs.forEach((element) {lista.add(element.data());});
    return lista;
  }
}

Future<bool> removeEventoFromFirestore(Evento evento) async{
  bool t=false;
  final ref = FirebaseFirestore.instance.collection("Cliente").doc(evento.email_cliente).collection("Eventi").doc(evento.anno+evento.mese+evento.giorno+evento.ora+evento.minuto).withConverter(
    fromFirestore: Evento.fromFirestore,
    toFirestore: (Evento evento, _) => evento.toFirestore(),
  );
  await ref.delete().then((value) => t=true).onError((error, stackTrace) => t=false);

  final ref_doc = FirebaseFirestore.instance.collection("Veterinario").doc(evento.email_dottore).collection("Eventi").doc(evento.anno+evento.mese+evento.giorno+evento.ora+evento.minuto).withConverter(
    fromFirestore: Evento.fromFirestore,
    toFirestore: (Evento evento, _) => evento.toFirestore(),
  );
  await ref_doc.delete().then((value) => t=true).onError((error, stackTrace) => t=false);
  return t;
}

List listaEventi = [
  Evento(
    nome_cliente: "Mario Rossi",
    nome_dottore: "Dottoressa Alice Gialli",
    email_cliente: "mariorossi@gmail.com",
    email_dottore: "dottalicegialli@gmail.com",
    nome_animale: "Fuffi",
    razza_animale: "Gatto",
    anno: "2022",
    mese: "11",
    giorno: "22",
    ora: "17",
    minuto: "30",
    tipoOperazione: "visita",
  ),
  Evento(
    nome_cliente: "Alice Gialli",
    nome_dottore: "Dottor Giovanni Verdi",
    email_cliente: "alicegialli@gmail.com",
    email_dottore: "dottgiovanniverdi@gmail.com",
    nome_animale: "Fuffi",
    razza_animale: "Pappagallo",
    anno: "2022",
    mese: "11",
    giorno: "22",
    ora: "11",
    minuto: "00",
    tipoOperazione: "visita",
  ),
  Evento(
    nome_cliente: "Giovanni Verdi",
    nome_dottore: "Dottor Mario Rossi",
    email_cliente: "giovanniverdi@gmail.com",
    email_dottore: "dottmariorossi@gmail.com",
    nome_animale: "Fuffi",
    razza_animale: "Gatto",
    anno: "2022",
    mese: "11",
    giorno: "22",
    ora: "18",
    minuto: "15",
    tipoOperazione: "visita",
  ),

];
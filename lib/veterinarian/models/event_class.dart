import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/models/cliente.dart';

enum TipoOperazione { operazione, visita }

class Evento extends Object{

  String nome_cliente = '', email_cliente = '', nome_dottore = '', email_dottore= '', razza_animale = '';
  String mese= "1",giorno= "1",anno ="2022", ora="00", minuto="00";
  String tipoOperazione ="visita";
  String durata  = '15m';

  Evento(
  {
    required this.nome_cliente, required this.nome_dottore, required this.email_cliente, required this.email_dottore,  required this.razza_animale, required this.anno, required this.mese, required this.giorno, required this.ora, required this.minuto, required this.tipoOperazione

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
    razza_animale: json['razza_animale'],
    anno: json['anno'],
    mese: json['mese'],
    giorno: json['giorno'],
    ora: json['ora'],
    minuto: json['minuto'],
    tipoOperazione: json['tipoOperazione'],
  );

  @override
  String toString() {
    return "${this.nome_cliente} | $razza_animale";
  }
}


void setEventoToFirestore(Evento evento) async{
  late Veterinario vet;
  await getVeterinarioFromFirestore(evento.email_dottore).then((value) => vet=value);
  dynamic eventiVet= vet.eventi;
  if (eventiVet != null) {
    print("non è null");
    print(eventiVet);
    eventiVet!.add(evento);
    print(eventiVet);
  }
  else{
    print("è null");
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

  
  print("Imposto evento per il dottore "+vet.email+" e evento "+eventiVet[0].toString());
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

  print("Imposto evento per il cliente");

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
    email_cliente: "Errore",
    email_dottore: "Errore",
    razza_animale: "Errore",
    anno: "Errore",
    mese: "Errore",
    giorno: "Errore",
    ora: "Errore",
    minuto: "Errore",
    tipoOperazione: "visita",
  ), growable: true);

  if(isCliente){
    print("Eseguo cliente");
    final res = await FirebaseFirestore.instance.collection("Cliente").doc(email).collection("Eventi").withConverter(
      fromFirestore: Evento.fromFirestore,
      toFirestore: (Evento evento, _) => evento.toFirestore(),
    ).get();
    res.docs.forEach((element) {lista.add(element.data());});
    return lista;
  }
  else{
    print("Eseguo dottore");
    final res = await FirebaseFirestore.instance.collection("Veterinario").doc(email).collection("Eventi").withConverter(
      fromFirestore: Evento.fromFirestore,
      toFirestore: (Evento evento, _) => evento.toFirestore(),
    ).get();
    res.docs.forEach((element) {lista.add(element.data());});
    return lista;
  }


}

List listaEventi = [
  Evento(
    nome_cliente: "Mario Rossi",
    nome_dottore: "Dottoressa Alice Gialli",
    email_cliente: "mariorossi@gmail.com",
    email_dottore: "dottalicegialli@gmail.com",
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
    razza_animale: "Gatto",
    anno: "2022",
    mese: "11",
    giorno: "22",
    ora: "18",
    minuto: "15",
    tipoOperazione: "visita",
  ),

];
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:justpet/customer/models/cliente.dart';
import 'package:justpet/global/models/utenteClass.dart';
// import 'package:justpet/global/models/utenteClass.dart';
import 'package:justpet/veterinarian/screens/veterinarian_appointment.dart';
import 'package:justpet/veterinarian/models/event_class.dart';

class Veterinario extends Utente{
  String email;
  String immagine;
  String immagine_profilo;
  String nome;
  String indirizzo;
  String votazione;
  String descrizione;
  List<String> turni;
  List<String> prenotazioni;
  List<dynamic> eventi;

  Veterinario ({required this.email, required this.immagine, required this.immagine_profilo, required this.nome, required this.indirizzo, required this.votazione, required this.descrizione, required this.turni, required this.prenotazioni, required this.eventi}) : super(email: email);

  @override
  String toString() {
    return nome;
  }

  factory Veterinario.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Veterinario(
      email: data?['email'],
      immagine: data?['immagine'],
      immagine_profilo: data?['immagine_profilo'],
      nome: data?['nome'],
      indirizzo: data?['indirizzo'],
      votazione: data?['votazione'],
      descrizione: data?['descrizione'],
      turni: List.from(data?['turni']),
      prenotazioni: List.from(data?['prenotazioni']),
      eventi: data?['eventi'].map((e) => e.toFirestore()).toList(),  //eventi.map((e) => e.toFirestore()).toList()
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "email": email,
      "immagine": immagine,
      "immagine_profilo": immagine_profilo,
      "nome": nome,
      "indirizzo": indirizzo,
      "votazione": votazione,
      "descrizione": descrizione,
      "turni": turni,
      "prenotazioni": prenotazioni,
      "eventi": eventi.map((e) => e.toFirestore()).toList(),
    };
  }
}

void setVeterinarioToFirestore(Veterinario veterinario) async{
  final docRef = FirebaseFirestore.instance
      .collection("Veterinario")
      .withConverter(
    fromFirestore: Veterinario.fromFirestore,
    toFirestore: (Veterinario vet, options) => vet.toFirestore(),
  )
      .doc(veterinario.email);
  await docRef.set(veterinario);
}

void updateVeterinarioOnFirestore(Veterinario veterinario, String prenotazione) async{
  /*final washingtonRef = db.collection("cites").doc("DC");
washingtonRef.update({"capital": true}).then(
    (value) => print("DocumentSnapshot successfully updated!"),
    onError: (e) => print("Error updating document $e"));*/

  List<String> prenotazioni=veterinario.prenotazioni!;
  prenotazioni.add(prenotazione);
  final docRef = FirebaseFirestore.instance
      .collection("Veterinario")
      .withConverter(
    fromFirestore: Veterinario.fromFirestore,
    toFirestore: (Veterinario veterinario, options) => veterinario.toFirestore(),
  )
      .doc(veterinario.email);
  await docRef.update({"prenotazioni": prenotazioni}).then(
          (value) => print("Prenotazione aggiunta con successo"),
      onError: (e) => print("Errore nell'aggiornamento del documento $e"));
}

Future<List<Veterinario>> getAllVeterinariFromFirestore() async{

  List<Veterinario> lista = List.filled(0, Veterinario(email: 'c',immagine: 'c', immagine_profilo: 'c', nome: 'c', indirizzo: 'c', votazione: 'c', descrizione: 'c', turni: [''], prenotazioni: ["5:00"], eventi: [evento]), growable: true);
  await FirebaseFirestore.instance.collection("Veterinario").withConverter(
    fromFirestore: Veterinario.fromFirestore,
    toFirestore: (Veterinario veterinario, _) => veterinario.toFirestore(),
  ).get().then(
        (res) => {
          res.docs.forEach((element) {lista.add(element.data() as Veterinario);})
        },
        onError: (e) => print("Impossibile ottenere i veterinari: $e"),);
  return lista;
}

Future<Veterinario> getVeterinarioFromFirestore(String email) async{

  late Veterinario? vet;
  final ref = FirebaseFirestore.instance.collection("Veterinario").doc(email).withConverter(
    fromFirestore: Veterinario.fromFirestore,
    toFirestore: (Veterinario veterinario, _) => veterinario.toFirestore(),
  );
  await ref.get().then((value) => {vet=value.data()});
  //final cliente = docSnap.data(); // Convert to Cliente object
  if (vet != null) {
    return vet!;
  } else {
    return veterinario_filler;
  }
}

Evento evento = Evento(
    nome_cliente: "Errore",
    nome_dottore: "Errore",
    email_cliente: "Errore",
    email_dottore: "Errore",
    nome_animale: "Errore",
    razza_animale: "Errore",
    anno: "",
    mese: "",
    giorno: "",
    ora: "",
    minuto: "",
    tipoOperazione: "visita",);

final List<Veterinario> veterinari = [
  Veterinario(
    email:"dottmariorossi@gmail.com",
    immagine: "veterinario1.jpg",
    immagine_profilo: "user_2.png",
    nome: "Dottor Mario Rossi",
    indirizzo: "Via Unità Italiana, 12",
    votazione: "4,5",
    descrizione: 'Il dottor Rossi vanta più di 10 anni di esperienza nel settore, grazie alla sua competenza acquisita negli anni e coltivata con il lavoro. Ha raggiunto la vetta dopo aver operato più di 75 animali, tutti con successo',
    turni: turni,
    prenotazioni: ["05:00"],
    eventi: List.filled(0, evento),
  ),
  Veterinario(
      email:"dottalicegialli@gmail.com",
      immagine: "veterinario2.jpg",
      immagine_profilo: "user_5.png",
      nome: "Dottoressa Alice Gialli",
      indirizzo: "Via Mazzini, 5",
      votazione: "4,8",
      descrizione: 'La dottoressa Gialli vanta più di 10 anni di esperienza nel settore, grazie alla sua competenza acquisita negli anni e coltivata con il lavoro. Ha raggiunto la vetta dopo aver operato più di 75 animali, tutti con successo',
      turni: turni,
      prenotazioni: ["05:00"],
    eventi: List.filled(0, evento)),
  Veterinario(
      email:"dottgiovanniverdi@gmail.com",
      immagine: "veterinario3.jpg",
      immagine_profilo: "user_3.png",
      nome: "Dottor Giovanni Verdi",
      indirizzo: "Via Colombo, 27",
      votazione: "4,2",
      descrizione: 'Il dottor Verdi vanta più di 10 anni di esperienza nel settore, grazie alla sua competenza acquisita negli anni e coltivata con il lavoro. Ha raggiunto la vetta dopo aver operato più di 75 animali, tutti con successo',
      turni: turni,
      prenotazioni: ["05:00"],
    eventi: List.filled(0, evento)),
];
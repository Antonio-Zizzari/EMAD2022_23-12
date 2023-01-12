import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/models/pet_class.dart';
import 'package:justpet/global/models/utenteClass.dart';
import 'package:justpet/veterinarian/models/event_class.dart';


class Cliente{
  String email, nome, cognome;
  List<Evento> eventi;

  Cliente({
    required this.email,
    required this.nome,
    required this.cognome,
    required this.eventi,
  });

  factory Cliente.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Cliente(
      email: data?['email'],
      nome: data?['nome'],
      cognome: data?['cognome'],
      eventi: data?['eventi'] is Iterable ? List.from(data?['eventi']) : [evento],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "email": email,
      "nome": nome,
      "cognome": cognome,
      "eventi": eventi.map((e) => e.toFirestore()).toList(),
    };
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': nome,
    'cognome': cognome,
    'eventi': eventi.map((e) => e.toJson()).toList(),
  };

  static Cliente fromJson(Map<String, dynamic> json) => Cliente(
    email: json['email'],
    nome: json['nome'],
    cognome: json['cognome'],
    eventi: json['eventi'].map((e) => e.toJson()).toList()
  );
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


Future<dynamic> getUtenteFromFirestore(String email) async{

  late Cliente cliente;
  late Veterinario vet;

  cliente = await getClienteFromFirestore(email);

  if(cliente!=null){
    print("Ritorno cliente");
    return cliente;
  }
  else{
    print("Provo con veterinario...");
    vet = await getVeterinarioFromFirestore(email);
    if(vet!=null){
      print("Ritorno veterinario");
      return vet;
    }
    else{
      print("Ritorno filler");
      return veterinario_filler;
    }
  }
}





Future<Cliente> getClienteFromFirestore(String email) async{
  late Cliente cliente;
  final ref = FirebaseFirestore.instance.collection("Cliente").doc(email).withConverter(
    fromFirestore: Cliente.fromFirestore,
    toFirestore: (Cliente cliente, _) => cliente.toFirestore(),
  );
  await ref.get().then((value) => {cliente=value.data()!});
  //final cliente = docSnap.data(); // Convert to Cliente object
  if (cliente != null) {
    return cliente;
  } else {
    return Cliente(
      email: "errore",
      nome: "errore",
      cognome: "errore",
      eventi: List.filled(0, evento),
    );
  }
}

void setClienteToFirestore(Cliente cliente) async{
  final docRef = FirebaseFirestore.instance
      .collection("Cliente")
      .withConverter(
    fromFirestore: Cliente.fromFirestore,
    toFirestore: (Cliente cliente, options) => cliente.toFirestore(),
  )
      .doc(cliente.email);
  await docRef.set(cliente);
}


/*
void addAnimaleClienteToFirestore(Cliente cliente, Pets pet){
  cliente.addPets(pet);
  FirebaseFirestore.instance.collection("Cliente").doc(cliente.email).update({'animali': cliente.animali});
}
*/


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:justpet/customer/models/pet_class.dart';


class Cliente{
  String email, nome, cognome;

  Cliente({
    required this.email,
    required this.nome,
    required this.cognome
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
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "email": email,
      "nome": nome,
      "cognome": cognome,
    };
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': nome,
    'cognome': cognome,
  };

  static Cliente fromJson(Map<String, dynamic> json) => Cliente(
    email: json['email'],
    nome: json['nome'],
    cognome: json['cognome'],
  );
}

Future<Cliente> getClienteFromFirestore(String email) async{
  final ref = FirebaseFirestore.instance.collection("Cliente").doc(email).withConverter(
    fromFirestore: Cliente.fromFirestore,
    toFirestore: (Cliente cliente, _) => cliente.toFirestore(),
  );
  final docSnap = await ref.get();
  final cliente = docSnap.data(); // Convert to Cliente object
  if (cliente != null) {
    return cliente;
  } else {
    return Cliente(
      email: "errore",
      nome: "errore",
      cognome: "errore",
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


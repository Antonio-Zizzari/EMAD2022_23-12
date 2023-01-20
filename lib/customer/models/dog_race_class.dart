import 'dart:convert';
import "dart:io";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

List tutteLeRazze=["AKITA AMERICANO",
  "AKITA INU",
  "ALANO",
  "ALASKAN MALAMUTE",
  "AMERICAN STAFFORDSHIRE TERRIER",
  "AUSTRALIAN CATTLE DOG",
  "AUSTRALIAN SHEPHERD",
  "BARBONCINO TOY",
  "BARBONE",
  "BASENJI",
  "BASSET HOUND",
  "BASSOTTO TEDESCO",
  "BEAGLE",
  "BICHON A POIL FRISE",
  "BOBTAIL",
  "BOLOGNESE",
  "BOSTON TERRIER",
  "BOVARO DEL BERNESE",
  "BOXER",
  "BRACCO ITALIANO",
  "BRETON",
  "BULL TERRIER",
  "BULL TERRIER MINIATURA",
  "BULLDOG INGLESE",
  "BULLMASTIFF",
  "CANE CORSO",
  "CANE DA MONTAGNA DEI PIRENEI",
  "CANE DA PASTORE BELGA",
  "CANE DA PASTORE BERGAMASCO",
  "CANE DA PASTORE DELL'ASIA CENTRALE",
  "CARLINO",
  "CAVALIER KING CHARLES SPANIEL",
  "CHIHUAHUA",
  "CHIN GIAPPONESE",
  "CHOW CHOW",
  "COCKER AMERICANO",
  "COCKER SPANIEL INGLESE",
  "COTON DE TULEAR",
  "DALMATA",
  "DOBERMANN",
  "DOGO ARGENTINO",
  "DOGUE DE BORDEAUX",
  "EPAGNEUL NANO CONTINENTALE",
  "FILA BRASILEIRO",
  "FLAT COATED RETRIEVER",
  "FOX TERRIER",
  "GOLDEN RETRIEVER",
  "HOVAWART",
  "JACK RUSSELL TERRIER",
  "LABRADOR RETRIEVER",
  "LAGOTTO ROMAGNOLO",
  "LAPINKOIRA",
  "LEONBERGER",
  "LEVRIERO",
  "LUPO CECOSLOVACCO",
  "MALTESE",
  "MASTINO NAPOLETANO",
  "None",
  "PASTORE MAREMMANO ABRUZZESE",
  "PASTORE SCOZZESE",
  "PASTORE SVIZZERO BIANCO",
  "PASTORE TEDESCO",
  "PECHINESE",
  "PINSCHER NANO",
  "PITBULL",
  "POINTER",
  "RHODESIAN RIDGEBACK",
  "ROTTWEILER",
  "SAMOIEDO",
  "SAN BERNARDO",
  "SCHNAUZER GIGANTE",
  "SCHNAUZER MEDIO",
  "SCHNAUZER NANO",
  "SEGUGIO ITALIANO",
  "SETTER IRLANDESE",
  "SHAR PEI",
  "SHIBA INU",
  "SHIH TZU",
  "SIBERIAN HUSKY",
  "SPINONE ITALIANO",
  "SPITZ",
  "SPITZ FINNICO",
  "SPITZ TEDESCHI WOLFSPITZ",
  "STAFFORDSHIRE BULL TERRIER",
  "TERRANOVA",
  "TIBETAN MASTIFF",
  "VOLPINO ITALIANO",
  "VOLPINO POMERANIA",
  "WEIMARANER",
  "WELSH CORGI PEMBROKE",
  "WEST HIGHLAND WHITE TERRIER",
  "YORKSHIRE TERRIER",
];

class DogRace{
  final String race, description, pathImage;

  DogRace({
    required this.race,
    required this.description,
    required this.pathImage
  });

  factory DogRace.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return DogRace(
      race: data?['race'],
      description: data?['description'],
      pathImage: data?['pathImage'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "race": race,
      "description": description,
      "pathImage": pathImage,
    };
  }

}

void setDogRaceToFirestore(String email, DogRace dogRace) async{
  final docRef = FirebaseFirestore.instance
      .collection("Razza")
      .doc(email)
      .collection("Razze")
      .withConverter(
    fromFirestore: DogRace.fromFirestore,
    toFirestore: (DogRace razza, options) => razza.toFirestore(),
  )
      .doc(dogRace.race);
  await docRef.set(dogRace);
}

Future<List<DogRace>> getAllRazzeFromFirestore(String email) async{
  final List<DogRace> lista = [];
  final ref = FirebaseFirestore.instance.collection("Razza").doc(email).collection("Razze").withConverter(
    fromFirestore: DogRace.fromFirestore,
    toFirestore: (DogRace razza, _) => razza.toFirestore(),
  );
  final docSnap = await ref.get();
  docSnap.docs.forEach((element) {lista.add(element.data());});
  return lista;
}

Future<DogRace> getRazzaFromFirestore(String email, String race) async{
  final ref = FirebaseFirestore.instance.collection("Razza").doc(email).collection("Razze").doc(race).withConverter(
    fromFirestore: DogRace.fromFirestore,
    toFirestore: (DogRace razza, _) => razza.toFirestore(),
  );
  final docSnap = await ref.get();
  final razza = docSnap.data(); // Convert to DogRace object
  if (razza != null) {
    return razza;
  } else {
    return DogRace(race: "Errore", description: "Errore", pathImage: "Errore");
  }
}

Future<bool> removeRazzaFromFirestore(String email, String race) async{
  bool t=false;
  final ref = FirebaseFirestore.instance.collection("Razza").doc(email).collection("Razze").doc(race).withConverter(
    fromFirestore: DogRace.fromFirestore,
    toFirestore: (DogRace razza, _) => razza.toFirestore(),
  );
  await ref.delete().then((value) => t=true).onError((error, stackTrace) => t=false);
  return t;
}

Future<Map<String,dynamic>> getAllRaces () async{
  List<String> races_ids = List.filled(0, "", growable: true);
  List<DogRace> races = List.filled(0, DogRace(
      race: "Rottweiler",
      description: descrizioneTest,
      pathImage: "assets/images/dogRace1.jpg"
  ), growable: true);
    //print(data.runtimeType);
    //print(data);

    for (String entry in tutteLeRazze) {
      races_ids.add(entry);
      races.add(DogRace(race: entry,
          description: descrizioneTest,
          pathImage: "assets/images/dogRace1.jpg"));
    }
/*    print("[");
    for(String test in races_ids){
      print("\""+test+"\",");
    }
    print("]");*/
    return Map.fromIterables(races_ids,races);
}



String descrizioneTest = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

List<DogRace> dogRaces = [
  DogRace(
      race: "Rottweiler",
      description: descrizioneTest,
      pathImage: "assets/images/dogRace1.jpg"
  ),
  DogRace(
    race: "Siberian Husky",
    description: descrizioneTest,
    pathImage: "assets/images/dogRace2.jpg"
  ),
  DogRace(
    race: "Akita Inu",
    description: descrizioneTest,
    pathImage: "assets/images/dogRace3.jpg"
  ),
  DogRace(
    race: "Carlino",
    description: descrizioneTest,
    pathImage: "assets/images/dogRace4.jpg"
  ),
];

/*
Map<String, DogRace> allRaces = {
  "AKITA AMERICANO": DogRace(race: "Akita Americano", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "AKITA INU": DogRace(race: "Akita Inu", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "ALANO": DogRace(race: "Alano", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "ALASKAN MALAMUTE": DogRace(race: "Alaskan Malamute", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "AMERICAN STAFFORDSHIRE TERRIER": DogRace(race: "American Staffordshire terrier", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "AUSTRALIAN CATTLE DOG": DogRace(race: "Australian Cattle Dog", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "AUSTRALIAN SHEPHERD": DogRace(race: "Australian Shepherd", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BARBONCINO TOY": DogRace(race: "Barboncino Toy", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BARBONE": DogRace(race: "Barbone", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BASENJI": DogRace(race: "Basenji", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BASSET HOUND": DogRace(race: "Basset Hound", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BASSOTTO TEDESCO": DogRace(race: "Bassotto Tedesco", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BEAGLE": DogRace(race: "Beagle", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BICHON A POIL FRISE": DogRace(race: "Bichon A Poil Frise", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BOBTAIL": DogRace(race: "Bobtail", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BOLOGNESE": DogRace(race: "Bolognese", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BOSTON TERRIER": DogRace(race: "Boston Terrier", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "BOVARO DEL BERNESE": DogRace(race: "Bovaro del Bernese", description: "descrizioneTest", pathImage: "assets/images/dogRace1.jpg"),
  "None": DogRace(race: "n", description: "n", pathImage: "n"),
};*/

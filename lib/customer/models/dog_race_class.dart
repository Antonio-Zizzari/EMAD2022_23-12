import 'package:cloud_firestore/cloud_firestore.dart';

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
};
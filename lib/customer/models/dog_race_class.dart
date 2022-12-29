class DogRace{
  final String race, description, pathImage;

  DogRace({
    required this.race,
    required this.description,
    required this.pathImage
  });
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
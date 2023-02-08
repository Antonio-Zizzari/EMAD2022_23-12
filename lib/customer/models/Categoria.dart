import 'package:flutter/foundation.dart';

class Categoria {
  final String nome;
  final int numeroCorsi;
  final String immagine;

  Categoria(this.nome, this.numeroCorsi, this.immagine);
}

List<Categoria> categorie = [
  Categoria('Gatti', 17, "assets/cat.jpg"),
  Categoria('Cani', 25, "assets/dog.jpg"),
  Categoria('Pappagalli', 13, "assets/parrot.jpg"),
  Categoria('Furetti', 3, "assets/images/furetto.jpg"),
];

/*List<Category> categories = categoriesData
    .map((item) => Category(item['name'].toString(), int.parse(item['courses'].toString()), item['image'].toString()))
    .toList();

var categoriesData = [
  {"name": "Gatti", 'courses': 17, 'image': "assets/cat.jpg"},
  {"name": "Cani", 'courses': 25, 'image': "assets/dog.jpg"},
  {
    "name": "Pappagalli",
    'courses': 13,
    'image': "assets/parrot.jpg"
  },
  {"name": "Lupi", 'courses': 17, 'image': "assets/dog.jpg"},
];*/
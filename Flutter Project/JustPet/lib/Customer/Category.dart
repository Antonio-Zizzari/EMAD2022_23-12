import 'package:flutter/foundation.dart';

class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
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
];
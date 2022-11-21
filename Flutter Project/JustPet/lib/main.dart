import 'package:flutter/material.dart';
import 'animal-single-card.dart';
import 'animal-card.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      //'/': (context) => Chat(),
      '/': (context) => MyPets(),
      //'/location': (context) => ChooseLocation(),
    }
));
import 'package:flutter/material.dart';

class BodyPart{
  IconData icon;
  String text;
  double? top;
  double? left;
  double? right;
  double? bottom;
  Color? color;

  BodyPart({
    required this.icon,
    required this.text,
    this.top,
    this.left,
    this.bottom,
    this.right,
    this.color
  });
}


List<BodyPart> listaPartiCane = [
  BodyPart(icon: Icons.headphones, text: 'Comportamento', top: 10, left: 60, color: Colors.red[700], ),
  BodyPart(icon: Icons.remove_red_eye, text: 'Oculistica', top: 50, left: 60, color: Colors.blue[800], ),
  BodyPart(icon: Icons.settings_bluetooth_outlined, text: 'Odontostomatologia', top: 90, left: 20, color: Colors.pink[700], ),
  BodyPart(icon: Icons.account_tree, text: 'Algologia', top: 120, right: 100, color: Colors.orange[700], ),
  BodyPart(icon: Icons.water_drop, text: 'Dermatologia', top: 150, left: 40, color: Colors.blueAccent[700], ),
  BodyPart(icon: Icons.balance, text: 'Nefrologia', bottom: 120, right: 60, color: Colors.yellow, ),
  BodyPart(icon: Icons.confirmation_num, text: 'Gastroenterologia', color: Colors.red[700], ),
  BodyPart(icon: Icons.label_important, text: 'Ortopedia', bottom: 30, right: 30, color: Colors.green[700], ),
  BodyPart(icon: Icons.access_alarms_rounded, text: 'Urologia', bottom: 60, right: 80, color: Colors.black54, ),

];

List<BodyPart> listaPartiGatto = [
  BodyPart(icon: Icons.headphones, text: 'Comportamento', top: 10, right: 110, color: Colors.red[700]),
  BodyPart(icon: Icons.remove_red_eye, text: 'Oculistica', top: 55, left: 122, color: Colors.blue[800], ),
  BodyPart(icon: Icons.settings_bluetooth_outlined, text: 'Odontostomatologia', top: 90, left: 100, color: Colors.pink[700], ),
  BodyPart(icon: Icons.account_tree, text: 'Algologia', top: 120, right: 100, color: Colors.orange[700], ),
  BodyPart(icon: Icons.water_drop, text: 'Dermatologia', top: 170, left: 40, color: Colors.blueAccent[700], ),
  BodyPart(icon: Icons.balance, text: 'Nefrologia', bottom: 120, right: 40, color: Colors.yellow, ),
  BodyPart(icon: Icons.confirmation_num, text: 'Gastroenterologia', bottom: 90, right: 30, color: Colors.red[700], ),
  BodyPart(icon: Icons.label_important, text: 'Ortopedia', bottom: 10, right: 30, color: Colors.green[700], ),
  BodyPart(icon: Icons.access_alarms_rounded, text: 'Urologia', bottom: 40, right: 120, color: Colors.black54, ),
];
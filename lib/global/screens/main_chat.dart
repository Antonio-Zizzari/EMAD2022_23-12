// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:justpet/global/components/body_chat.dart';
import 'package:justpet/global/models/color.dart';

import '../components/SideMenu.dart';
import '../../global/components/appbar.dart';


class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey)/*AppBarVeterinario(
        title: 'Prenotazioni',
        showSearch: false,
      )*/,
      drawer: SideMenu(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final docUser = FirebaseFirestore.instance.collection('Cliente').doc("email.text.trim()");

          final json = {
            'email': 'email.text.trim()',
            'nome': "Gianluca",
            'cognome': "Rossi"
          };

          await docUser.set(json);
        },
        child: Icon(Icons.person_add),
        backgroundColor: kPrimaryColor,
      ),

    );
  }

  AppBar buildBar() {
    return AppBar(
      centerTitle: false,
      title: Text("Chat",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          letterSpacing: 4.0,
        ),
        ),
      backgroundColor: kPrimaryColor,

    );
  }

}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/models/luiss_class.dart';
import 'package:justpet/customer/models/utils_functions.dart';
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
          /*print("the response is:\n");
          LuissClass response=Return_Sorted_LUIS_List(await LuisQuery("Vorrei un cane molto socievole, adatto per la famiglia e per i bambini che non sbavi tanto e che abbia il pelo lucido."));
          print(response.razza);
          print(response.score);*/
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

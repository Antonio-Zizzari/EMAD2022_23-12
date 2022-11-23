// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:justpet/chat_screen/body_chat.dart';
import 'package:justpet/common_models/color.dart';


class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
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

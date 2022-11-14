import 'package:flutter/material.dart';
import 'package:justpet/chat_screen/main_chat.dart';
import 'chat_screen/message_screen.dart';
import 'package:justpet/test.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      //'/': (context) => Chat(),
      '/': (context) => MainAppBar(),
      //'/location': (context) => ChooseLocation(),
    }
));
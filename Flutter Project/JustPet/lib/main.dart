import 'package:flutter/material.dart';
import 'package:test1/chat_screen/chat.dart';
import 'chat_screen/message.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Chat(),
      //'/user_chat': (context) => MessagesScreen(),
      //'/location': (context) => ChooseLocation(),
    }
));
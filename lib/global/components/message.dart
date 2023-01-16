import 'package:flutter/material.dart';
import 'package:justpet/global/models/chat/chat_class.dart';
import 'package:justpet/global/models/padding.dart';

import '../models/color.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Chat data;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.data.image),
            ),
            SizedBox(width: kDefaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.name,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Active"+ widget.data.time,
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.local_phone),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.videocam),
          ),
          SizedBox(width: 10,)
        ],
      ),
      body: Column(

      ),
    );
  }
}

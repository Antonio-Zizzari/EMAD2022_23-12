import 'package:flutter/material.dart';
import 'package:justpet/global/components/message_type.dart';
import 'package:justpet/global/models/chat/chat_class.dart';
import 'package:justpet/global/models/padding.dart';

import 'package:justpet/global/models/chat/chat_message.dart';

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
        backgroundColor: Colors.red,
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
                  "Attivo "+ widget.data.time,
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
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ListView.builder(
                    itemCount: demeChatMessages.length,
                    itemBuilder: (context, index) =>
                        Message(message: demeChatMessages[index],image : widget.data.image),
                        ),
              )
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 32,
                  color: Colors.red.withOpacity(0.08),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Icon(Icons.mic, color: Colors.red),
                  SizedBox(width: kDefaultPadding),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sentiment_satisfied_alt_outlined,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.64),
                          ),
                          SizedBox(width: kDefaultPadding / 4),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Scrivi un messaggio...",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.64),
                          ),
                          SizedBox(width: kDefaultPadding / 4),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 18,),
                  Icon(Icons.send, color: Colors.red),
                ],
              ),
            ),
          ),
        ],

      ),

    );
  }



}

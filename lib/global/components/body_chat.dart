import 'package:flutter/material.dart';
import 'package:justpet/global/components/message_screen.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/global/models/chat/chat_class.dart';
import 'package:justpet/global/models/padding.dart';

import '../../utils/search_bar_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final Function(String query) queryFunction = chatSearchBarQuery;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: kPrimaryColor,
          padding: const EdgeInsets.all(10),
          child: Text("Chat",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,10,0,0),
          child: SearchBarWidget(queryFunction: chatSearchBarQuery, hintText: "Cerca un contatto"),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (context, index) =>
                    ChatCard(
                      chat: chatsData[index],
                      tapFunction: () =>  Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => MessagesScreen(data: chatsData[index],),
                        ),
                    )
            )
        )
    ),
    ]);
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.tapFunction,

  }) : super(key: key);

  final Chat chat;
  final VoidCallback tapFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.20),
      child: Column(
        children: [
          const Divider(
            color: Colors.black26,
          ),
          SizedBox(height: 5,),
          InkWell(
            onTap: tapFunction,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(chat.image),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.name,
                          style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),
                        ),

                        Opacity(
                          opacity: 0.64,
                          child: Text(
                            chat.lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.64,
                  child: Text(chat.time),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

void chatSearchBarQuery(String query){
  return;
}

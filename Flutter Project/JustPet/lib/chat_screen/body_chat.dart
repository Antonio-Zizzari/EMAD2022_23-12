import 'package:flutter/material.dart';
import 'package:test1/chat_screen/message.dart';
import 'package:test1/common_models/color.dart';
import 'package:test1/common_class/chat_class.dart';
import 'package:test1/common_models/padding.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(25,25,25,5),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: ksecondaryColor.withOpacity(0.32),
            ),
          ),
          child: const TextField(
            //onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: kPrimaryColor,
              ),
              hintText: "Trova contatto",
              hintStyle: TextStyle(color: ksecondaryColor),
            ),
          ),
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

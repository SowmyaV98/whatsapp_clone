import 'package:flutter/material.dart';

import '../CustomUI/customCard.dart';
import '../Model/chat_model.dart';
import '../Screens/selectcontact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatModel> chats = [

    ChatModel(
      name: "Harsha",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person-icon.svg"
    ),
    ChatModel(
      name: "Deepak",
      isGroup: false,
      currentMessage: "Hi Harsha",
      time: "10:00",
      icon: "person-icon.svg"
    ),
    ChatModel(
      name: "TRIO",
      isGroup: true,
      currentMessage: "Hello Everyone!! Wassup??",
      time: "12:00",
      icon: "groups-icon.svg"
    ),
    ChatModel(
      name: "Sowmya",
      isGroup: false,
      currentMessage: "Hi Harsha",
      time: "10:00",
      icon: "person-icon.svg"
    ),
    ChatModel(
      name: "Equal",
      isGroup: true,
      currentMessage: "Hi mom",
      time: "5:00",
      icon: "groups-icon.svg"
    ),
    ChatModel(
        name: "Friends",
        isGroup: true,
        currentMessage: "Hi Buddy",
        time: "12:00",
        icon: "groups-icon.svg"
    ),
    ChatModel(
        name: "Family",
        isGroup: true,
        currentMessage: "Hello Everyone!! Wassup??",
        time: "12:00",
        icon: "groups-icon.svg"
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor:  const Color(0xFF075E54),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()),
          );
        },
        child: const Icon(Icons.chat,),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) => CustomCard(
              chatModel: chats[index],
              ),
        ),
    );
  }
}
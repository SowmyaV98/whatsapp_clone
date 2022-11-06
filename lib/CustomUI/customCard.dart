import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/chat_model.dart';
import '../Screens/individualPage.dart';


class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context)=> IndividualPage(chatModel: chatModel,)));
      },
      child: Column(
        children: [
        ListTile(
        leading: CircleAvatar(
          radius: 30,
          // ignore: sort_child_properties_last
          child: SvgPicture.asset(
            (chatModel.isGroup ?? false)? "assets/groups-icon.svg" : "assets/person-icon.svg",
          color: Colors.white,
          height:37,
          width: 37,
          ),
          backgroundColor: Colors.blueGrey,
        ),
        // ignore: prefer_const_constructors
        title: Text(
          chatModel.name ??'Name',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.done_all),
            const SizedBox(
              width: 3,
            ),
            Text(
              chatModel.currentMessage ?? 'message',
          style: const TextStyle(
            fontSize: 13,
          ),
          ),
          ],
        ),
        trailing: Text(chatModel.time ?? 'time'),
      ),
      const Padding(
        padding: EdgeInsets.only(right: 20, left: 80),
        child: Divider(
          thickness: 1,
          ),
      )
      ],
      ),
    );
  }
  
}

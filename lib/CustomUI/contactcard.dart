import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/chat_model.dart';

class  ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset(
                "assets/person-icon.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              ),
            ),
            contact.select? const Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 11,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            )
                :Container(),
          ],
        ),
      ),
      title: Text(
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        contact.name ?? 'name',
      ),
        subtitle: Text(
          contact.status ?? 'status',
          style: const TextStyle(
              fontSize: 13
          ),
        )
    );
  }
}



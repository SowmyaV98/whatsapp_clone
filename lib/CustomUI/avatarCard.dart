import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/chat_model.dart';

class AvtarCard extends StatelessWidget {
  const AvtarCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
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
              const Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(contact.name ?? 'name', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../CustomUI/avatarCard.dart';
import '../CustomUI/contactcard.dart';
import '../Model/chat_model.dart';


class CreateGroup extends StatefulWidget {
  CreateGroup({super.key});



  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
        name: "Dad",
        status: "Busy"
    ),
    ChatModel(
        name: "Deepak",
        status: "Available"
    ),
    ChatModel(
        name: "Harsha",
        status: "Busy"
    ),
    ChatModel(
        name: "Mom",
        status: "Available"
    ),
    ChatModel(
        name: "Sowmya",
        status: "Hey there! I am using WhatsApp."
    ),
    ChatModel(
        name: "Sravanthi",
        status: "Available"
    ),

  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context){


    return  Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF075E54),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: const [
              Text("New Group",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  )
              ),
              Text(
                "Add Participents",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 26,)
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context,index) {
                  if(index==0)
                    {
                      return Container(
                        height: groups.length > 0 ? 90 : 10,
                      );
                    }
                  return InkWell(
                    onTap: (){
                      if(contacts[index - 1].select==false){
    setState(() {
    contacts[index - 1].select = true;
    groups.add(contacts[index - 1]);
    });
    }
                        else
                          {
                            setState(() {
                              contacts[index - 1].select = false;
                              groups.add(contacts[index - 1]);
                            });
                          }
                      },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }
            ),
            groups.length>0
      ? Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: contacts.length,
                    itemBuilder: (context, index){
                        if(contacts[index].select==true)
                          {
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  groups.remove(contacts[index]);
                                  contacts[index].select = false;
                                });
                              },
                              child: AvtarCard(
                                  contact: contacts[index],
                              ),
                            );
                          }
                        else
                          {
                            return Container();
                          }
                      }
                  ),
                ),
                Divider(
                  thickness: 1,
                )
              ],
            )
               :  Container(),
          ],
        ),
    );
  }
}
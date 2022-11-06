import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Model/chat_model.dart';


class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key,this.chatModel}) : super(key: key);
  final ChatModel? chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus)
      {
        setState(() {
          show = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor:  const Color(0xFF075E54),
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_back,size: 24,),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  child: SvgPicture.asset(
                    (widget.chatModel?.isGroup ?? true)? "assets/groups-icon.svg" : "assets/person-icon.svg",
                    color: Colors.white,
                    height:37,
                    width: 37,
                  ),
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(widget.chatModel?.name ??"name",style: const TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
                ),
                  const Text("last seen today at 12:05",style: TextStyle(
                    fontSize: 13,
                  ),)
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.videocam)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
            PopupMenuButton<String>(
              padding: EdgeInsets.all(0),
                onSelected: (value){
                  print(value);
                },
                itemBuilder: (BuildContext context){
                  return [
                    const PopupMenuItem(
                      value: "View Contact",
                      child: Text("View Contact"),
                    ),
                    const PopupMenuItem(
                      value: "Media, Links, and Docs",
                      child: Text("Media, Links, and Docs"),
                    ),
                    const PopupMenuItem(
                      value: "Whatsapp Web",
                      child: Text("Whatsapp Web"),
                    ),
                    const PopupMenuItem(
                      value: "Search",
                      child: Text("Search"),
                    ),
                    const PopupMenuItem(
                      value: "Mute Notifications",
                      child: Text("Mute Notifications"),
                    ),
                    const PopupMenuItem(
                      value: "Wallpaper",
                      child: Text("Wallpaper"),
                    ),
                  ];
                }
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                hintStyle: const TextStyle(color: Colors.grey),
                                prefixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.emoji_emotions_outlined,
                                  ),
                                  onPressed: (){
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.attach_file),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder) =>
                                                bottomsheet());
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.camera_alt),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                contentPadding: const EdgeInsets.all(5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            right: 5,
                            left: 2,
                          ),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: const Color(0xFF128C7E),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic,
                                color: Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),
                    show?emojiSelect():Container(),
                  ],
                ),
              ),
            ],
          ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              }
              );

            }
            else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }
  Widget bottomsheet()
  {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.person, Colors.blue, "Contact"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
              text,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
  Widget emojiSelect()
  {
    return EmojiPicker(

        onEmojiSelected: (emoji, Category) {
          print(emoji);
          setState(() {
            var emoji;
            _controller.text= _controller.text + emoji?.emoji;
          });
        });
  }
}
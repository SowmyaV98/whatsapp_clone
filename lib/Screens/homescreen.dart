import 'package:flutter/material.dart';

import '../Pages/chatPage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _tabController; 
  @override
  void initState() {
    super.initState();
    _tabController= TabController(length: 4, vsync: this,initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        title:const Text("Whatsapp Clone"),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search)),
        PopupMenuButton<String>(
          // ignore: non_constant_identifier_names
          onSelected: (Value){
            print(Value);
          },
          itemBuilder: (BuildContext context){
          return [
          const PopupMenuItem(
            value: "New group",
            child: Text("New Group"),
            ),
          const PopupMenuItem(
            value: "New broadcast",
            child: Text("New broadcast"),
            ),
          const PopupMenuItem(
            value: "Whatsapp Web",
            child: Text("Whatsapp Web"),
            ),
          const PopupMenuItem(
            value: "Starred messages",
            child: Text("Starred messages"),
            ),
          const PopupMenuItem(
            value: "Settings",
            child: Text("Settings"),
            ),
          ];
        })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
          const Tab(
            icon: Icon(Icons.camera_alt),
          ),
          const Tab(
            text: "CHATS",
          ),
          const Tab(text: "STATUS",),
          const Tab(text: "CALLS"),
        ],
         controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Text("camera"),
          ChatPage(),
          Text("Status"),
          Text("Calls"),
        ],
      ),
    );
  }
}

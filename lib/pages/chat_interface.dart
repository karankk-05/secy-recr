import 'package:flutter/material.dart';
import 'chat_list.dart';
import 'chat_interface.dart';
import 'chat_screen.dart';
import '../models/chat.dart';
import '../colors_decorations/decorations.dart';
class ChatInterface extends StatefulWidget {
  @override
  _ChatInterfaceState createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  String? selectedUser;

  void onSelectUser(String user) {
    setState(() {
      selectedUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    mytext.context=context;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1, // 1/4th of the screen
            child: ChatList(onSelectUser: onSelectUser),
          ),
          Expanded(
            flex: 3, // 3/4th of the screen
            child: selectedUser != null
                ? ChatScreen(user: selectedUser!)
                : Center(
                    child: Text('Select a chat to start messaging',style: mytext.headingtext1(fontSize: 20),),
                  ),
          ),
        ],
      ),
    );
  }
}
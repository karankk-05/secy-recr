import 'package:flutter/material.dart';
import '../models/chat.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class ChatScreen extends StatefulWidget {
  final String user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add(Message(
          userName: widget.user,
          content: _messageController.text,
          profilePic: 'assets/your_profile_pic.png', // Replace with actual profile pic
          isCurrentUser: true,
        ));
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(messages.firstWhere((element) => element.userName == widget.user).profilePic),
              ),
              SizedBox(width: 10),
              Text(widget.user, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final reversedIndex = messages.length - 1 - index;
              final message = messages[reversedIndex];
              if (message.userName == widget.user || message.isCurrentUser) {
                return Align(
                  alignment: message.isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: message.isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        if (!message.isCurrentUser) ...[
                          message.profilePic.isNotEmpty
                              ? CircleAvatar(
                                  backgroundImage: AssetImage(message.profilePic),
                                )
                              : CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                          SizedBox(width: 8),
                        ],
                        Container(
                          decoration: BoxDecoration(
                            color: message.isCurrentUser
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Theme.of(context).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Text(message.content),
                        ),
                        if (message.isCurrentUser) ...[
                          SizedBox(width: 8),
                          user.imageUrl != null && user.imageUrl!.isNotEmpty
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(user.imageUrl!),
                                )
                              : CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                        ],
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (value) {
                    _sendMessage();
                  },
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

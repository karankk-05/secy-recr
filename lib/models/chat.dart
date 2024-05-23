import 'package:flutter/material.dart';

class Message {
  final String userName;
  final String content;
  final String profilePic;
  final bool isCurrentUser; // New field to identify if the message is from the current user

  Message({
    required this.userName,
    required this.content,
    required this.profilePic,
    this.isCurrentUser = false, // Default to false
  });
}

List<Message> messages = [
  Message(userName: 'Burhan', content: 'Hello there!', profilePic: 'assets/Screenshot 2024-05-23 220456.png'),
  Message(userName: 'Yash', content: 'Hi!', profilePic: 'assets/Screenshot 2024-05-23 220519.png'),
  Message(userName: 'Shreya', content: 'How are you?', profilePic: 'assets/Screenshot 2024-05-23 220801.png'),
  Message(userName: 'Nishant', content: 'Good morning', profilePic: 'assets/Screenshot 2024-05-23 220928.png'),
  Message(userName: 'Ritvik', content: 'What\'s up?', profilePic: 'assets/Screenshot 2024-05-23 221028.png'),
];


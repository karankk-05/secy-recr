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
  Message(userName: 'Alice', content: 'Hello there!', profilePic: 'assets/alice.png'),
  Message(userName: 'Bob', content: 'Hi!', profilePic: 'assets/bob.png'),
  Message(userName: 'Charlie', content: 'How are you?', profilePic: 'assets/charlie.png'),
  Message(userName: 'Dave', content: 'Good morning', profilePic: 'assets/dave.png'),
  Message(userName: 'Eve', content: 'What\'s up?', profilePic: 'assets/eve.png'),
  // Add more messages here
];

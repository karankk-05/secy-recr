import 'package:flutter/material.dart';
import '../models/chat.dart'; // Assuming this imports your Chat model

class ChatList extends StatelessWidget {
  final Function(String) onSelectUser;

  ChatList({required this.onSelectUser});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final user = messages[index].userName;
        final profilePic = messages[index].profilePic;

        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            // Set padding as needed
            contentPadding: EdgeInsets.all(5.0),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white38),
              borderRadius: BorderRadius.circular(50), // This makes the shape circular
            ),
          
            // Leading widget: CircleAvatar with customizable border and gradient
            leading: CircleAvatar(
              backgroundImage: AssetImage(profilePic),
              backgroundColor: Colors.transparent, // Remove default background color
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.0, // Border width
                  ),
                 
                ),
              ),
            ),
          
            // Title text with flexible styling and potential truncation
            title: Text(
              user,
              style: TextStyle(
                fontSize: 16.0, // Adjust font size as needed
                fontWeight: FontWeight.w500, // Set a semi-bold weight
                color: Theme.of(context).colorScheme.onPrimary, // Use contrasting text color
                overflow: TextOverflow.ellipsis, // Truncate text if too long
              ),
            ),
          
            // Optional trailing icon or widget (adjust padding for spacing)
            // ... (add your trailing widget code here)
          
            onTap: () => onSelectUser(user), // Use arrow function for cleaner syntax
          ),
        );
      },
    );
  }
}

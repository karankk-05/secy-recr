import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import 'edit_details.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the UserProvider
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Section
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 7,
                          child: ProfileDetailCard2(
                            title: user.name,
                            detail: user.email,
                            size: 45,
                            size2: 20,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 3,
                                child: ProfileDetailCard(
                                  title: 'Gender',
                                  detail: user.gender ?? 'Add',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 3,
                                child: ProfileDetailCard(
                                  title: 'Batch',
                                  detail: user.batch ?? 'Add',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 3,
                                child: ProfileDetailCard(
                                  title: 'Address',
                                  detail: user.address ?? 'Add',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 3,
                                child: ProfileDetailCard(
                                  title: 'Phone Number',
                                  detail: user.phone ?? 'Add',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: TextButton(
                      
                        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditDetailsPage()),
  );


                      },
                      child: Text(
                        'Edit Details',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right Section
          Expanded(
            flex: 1,
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Profile image
                    Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey[350], // Placeholder color
                        borderRadius: BorderRadius.circular(20), // Half of width/height for circular shape
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: user.imageUrl != null
    ? Image.network(
        user.imageUrl!,
        width: 350,
        height: 350,
        fit: BoxFit.cover,
      )
    : Icon(
        Icons.person,
        size: 150,
        color: Colors.white,
      ), // Placeholder icon
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ProfileDetailCard extends StatelessWidget {
  final String title;
  final String detail;

  const ProfileDetailCard({
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.5),
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            SizedBox(height: 8),
            Text(
              detail != null ? detail : 'Add',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailCard2 extends StatelessWidget {
  final String title;
  final String detail;
  final double size;
  final double size2;

  const ProfileDetailCard2({
    required this.title,
    required this.detail,
    required this.size,
    required this.size2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.5),
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            SizedBox(height: 8),
            Text(
              detail != null ? detail : 'Add',
              style: TextStyle(
                fontSize: size2,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

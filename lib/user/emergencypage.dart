import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactCard(
              title: 'Police Department',
              phoneNumber: '911',
            ),
            ContactCard(
              title: 'Fire Department',
              phoneNumber: '911',
            ),
            ContactCard(
              title: 'Medical Emergency',
              phoneNumber: '911',
            ),
            ContactCard(
              title: 'Poison Control',
              phoneNumber: '1-800-222-1222',
            ),
            ContactCard(
              title: 'Local Hospital',
              phoneNumber: '123-456-7890',
            ),
            ContactCard(
              title: 'Emergency Services',
              phoneNumber: '911',
            ),
            ContactCard(
              title: 'Blood Bank',
              phoneNumber: '040-24745243',
            ),
            ContactCard(
              title: 'Child line',
              phoneNumber: '1098',
            ),
            // Add more ContactCard widgets for other departments
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String title;
  final String phoneNumber;

  ContactCard({
    required this.title,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text('Phone: $phoneNumber'),
        onTap: () {
          // You can implement a functionality here to make a call
          // or send an email when the user taps on the contact.
        },
      ),
    );
  }
}



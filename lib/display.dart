import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayDataScreen extends StatefulWidget {
  @override
  _DisplayDataScreenState createState() => _DisplayDataScreenState();
}

class _DisplayDataScreenState extends State<DisplayDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Volunteers'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('help').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); // Loading indicator
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var data = documents[index].data() as Map<String, dynamic>;

              // Extract data fields from the document
              String name = data['name'];
              String phoneNumber = data['phonenumber'];
              String address = data['address'];
              String description = data['description'];
              String filter = data['filter'];
              // String imageUrl = data['images'];

              return InkWell(
                onTap: () {
                  _showDetailsDialog(context, name, description,address);
                },
                child: Card(
                  child: ListTile(
                    title: Text('Name: $name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone Number: $phoneNumber'),
                        Text('Address: $address'),
                        Text('Filter: $filter'),
                      ],
                    ),
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(imageUrl),
                    // ), // Display the uploaded image in a circle
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showDetailsDialog(BuildContext context, String name, String description, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details for $name'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 50, // Adjust the radius as needed
              ),
              SizedBox(height: 16),
              Text('Description: $description'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Request'),
            ),
          ],
        );
      },
    );
  }
}

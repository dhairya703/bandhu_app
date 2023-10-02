import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  CollectionReference com2 = FirebaseFirestore.instance.collection('com2');
  late String message;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: MessageList(), // Use the MessageList widget here
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onChanged: (value) {
                      message = value;
                    },
                    decoration: InputDecoration(hintText: 'Write your Message here'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (message.isNotEmpty) {
                      await com2.add({
                        'message': message,
                        'timestamp': FieldValue.serverTimestamp(),
                      }).then((value) {
                        print("Message added");
                        // Clear the message input field
                        _messageController.clear();
                      });
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('com2').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<QueryDocumentSnapshot> messages = snapshot.data!.docs;

        List<Widget> messageWidgets = [];
        for (var messageDoc in messages) {
          final messageText = messageDoc['message'];
          messageWidgets.add(MessageWidget(messageText));
        }

        return ListView(
          reverse: true, // Start from the bottom
          children: messageWidgets,
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String message;

  MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message,style: TextStyle(color: Colors.white,fontSize: 20),),
      // Add more styling here if needed
    );
  }
}

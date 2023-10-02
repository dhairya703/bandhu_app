// firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final CollectionReference icentiveCollection =
  FirebaseFirestore.instance.collection('icentive');

  Future<void> addIncentive(String reward, double amount) async {
    try {
      await icentiveCollection.add({
        'reward': reward,
        'amount': amount,
      });
      print('Incentive added successfully');
    } catch (e) {
      print('Error adding incentive: $e');
    }
  }
}

class IncentivePortal extends StatefulWidget {
  const IncentivePortal({Key? key}) : super(key: key);

  @override
  _IncentivePortalState createState() => _IncentivePortalState();
}

class _IncentivePortalState extends State<IncentivePortal> {
  final FirestoreService firestoreService = FirestoreService(); // Create an instance of your Firestore service

  CollectionReference icentive = FirebaseFirestore.instance.collection('icentive');

  final TextEditingController rewardController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Incentive Page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: rewardController,
              decoration: InputDecoration(labelText: 'Reward Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final String rewardName = rewardController.text;
              final double rewardAmount = double.tryParse(amountController.text) ?? 0.0;

              if (rewardName.isNotEmpty && rewardAmount > 0) {
                firestoreService.addIncentive(rewardName, rewardAmount);
                rewardController.clear();
                amountController.clear();
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Invalid Input'),
                      content: Text('Please enter a valid reward name and amount.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: Text('Add Incentive'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: icentive.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var data = documents[index].data() as Map<String, dynamic>;

                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 4,
                      child: ListTile(
                        title: Text('Name Of Reward: ${data['reward'] ?? ''}'),
                        subtitle: Text('Worth Of Rs: ${data['amount'] ?? ''}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    rewardController.dispose();
    amountController.dispose();
    super.dispose();
  }
}

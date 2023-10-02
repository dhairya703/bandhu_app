import 'package:flutter/material.dart';
class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Shops"),),
        body:
      SingleChildScrollView(
      child: Column(
        children: [
          CustomCard(
            title: 'Vinayak Medical',
            subtitle: 'Medical',
            plusSign: true,
          ),
          CustomCard(
            title: 'Sharma General Store',
            subtitle: 'Grocery',
          ),
          CustomCard(
            title: 'Ritu Medical',
            subtitle: 'Medical',
            plusSign: true,
          ),
          CustomCard(
            title: 'Reliance Mart',
            subtitle: 'Grocery',
          ),
          CustomCard(
            title: 'Meenakshi Medical',
            subtitle: 'Medical',
            plusSign: true,
          ),
          CustomCard(
            title: 'Kumar General Store',
            subtitle: 'Grocery',
          ),
          CustomCard(
            title: 'Alankar Medical',
            subtitle: 'Medical',
            plusSign: true,
          ),
          CustomCard(
            title: 'Vinayak Medical',
            subtitle: 'Medical',
            plusSign: true,
          ),
          CustomCard(
            title: 'Sharma General Store',
            subtitle: 'Grocery',
          ),
          CustomCard(
            title: 'Ritu Medical',
            subtitle: 'Medical',
            plusSign: true,
          ),
          CustomCard(
            title: 'Reliance Mart',
            subtitle: 'Grocery',
          ),
          CustomCard(
            title: 'Meenakshi Medical',
            subtitle: 'Medical',
            plusSign: true,
          ),
          CustomCard(
            title: 'Kumar General Store',
            subtitle: 'Grocery',
          ),
          CustomCard(
            title: 'Alankar Medical',
            subtitle: 'Medical',
            plusSign: true,
          ),
        ],
      ),)
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool plusSign;

  CustomCard({
    required this.title,
    required this.subtitle,
    this.plusSign = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(16),
      child: SizedBox(
        height: 140,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 127, 191,209), Colors.white],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album),
                title: Row(
                  children: <Widget>[
                    Text('$title '),
                    if (plusSign)
                      Text(
                        '\u{2795}',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
                subtitle: Text(subtitle),
              ),
              ButtonBar(
                children: <Widget>[
                  ElevatedButton(
                    child: Text('Call Now'),
                    onPressed: () {
                      // Add your action here
                    },
                  ),
                  ElevatedButton(
                    child: Text('Send Text'),
                    onPressed: () {
                      // Add your action here
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
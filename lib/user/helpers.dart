import 'package:flutter/material.dart';
class help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
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
                  colors: [Color.fromARGB(255, 127, 191, 209), Colors.white],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Satyam'),
                    subtitle: Text('Scooter Mechanic'),
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
        ),
        Card(
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
                  colors: [Color.fromARGB(255, 127, 191, 209), Colors.white],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Kanudh'),
                    subtitle: Text('Bike Mechanic'),
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
        ),
        Card(
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
                  colors: [Color.fromARGB(255, 127, 191, 209), Colors.white],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Kapil'),
                    subtitle: Text('Car Mechanic'),
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
        ),
        Card(
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
                  colors: [Color.fromARGB(255, 127, 191, 209), Colors.white],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Jaya'),
                    subtitle: Text('Laundry'),
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
        ),
        Card(
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
                  colors: [Color.fromARGB(255, 127, 191, 209), Colors.white],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Kishan'),
                    subtitle: Text('Gardener'),
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
        ),
        Card(
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
                  colors: [Color.fromARGB(255, 127, 191, 209), Colors.white],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Kailash'),
                    subtitle: Text('House Keeping'),
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
        ),
        Card(
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
                  colors: [Color.fromARGB(255, 127, 191, 209), Colors.white],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Manas'),
                    subtitle: Text('Rating: 4.5/5'),
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
        ),
        Card(
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
                  colors: [Color.fromARGB(255, 127, 191, 209), Colors.white],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Romit'),
                    subtitle: Text('Rating: 4/5'),
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
        ),
        Card(
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
                  colors: [Color.fromARGB(255, 127, 191, 209), Colors.white],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Sarthak'),
                    subtitle: Text('Rating: 3/5'),
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
        ),
      ],
    );
  }
}
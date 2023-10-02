import 'package:bandhu/community/page1.dart';
import 'package:bandhu/community/page2.dart';
import 'package:flutter/material.dart';


class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Page1()),);
      },
              child: Text('Yoga'),
      ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Page2()),);
              },
              child: Text('Movies'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Page2()),);
              },
              child: Text('News'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Page2()),);
              },
              child: Text('Sports'),
            ),
          ],
        ),
      ),
    );
  }
}


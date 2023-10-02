import 'package:bandhu/user/userscreen.dart';
import 'package:bandhu/volunteer/volunteer.dart';
import 'package:flutter/material.dart';

class FrameElevenScreen extends StatelessWidget {
  const FrameElevenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2E3B4E),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  ClipOval(
                    child: Image.asset(
                      'assets/images/logo1.jpg',
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover, // Optional: This ensures the entire image is visible
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'Bandhu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily:""
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'आपका अपना सहायक',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Volunteer(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(200, 50),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text('Login as a Volunteer'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      minimumSize: Size(200, 50),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text('Login as a User'),

                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

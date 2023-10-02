import 'package:bandhu/bots/lib/home_page.dart';
import 'package:bandhu/community/community%20page.dart';
import 'package:bandhu/display.dart';
import 'package:bandhu/upload.dart';
import 'package:bandhu/user/MeditationPage.dart';
import 'package:bandhu/user/article.dart';
import 'package:bandhu/user/emergencypage.dart';
import 'package:bandhu/user/helpers.dart';
import 'package:bandhu/user/intentbased/intent.dart';
import 'package:bandhu/user/profileuser.dart';
import 'package:bandhu/user/shops.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
class usershome extends StatefulWidget {
  const usershome({Key? key}) : super(key: key);

  @override
  State<usershome> createState() => _usershomeState();
}

class _usershomeState extends State<usershome> {
  final List<String> cardData = [
    "Card 1",
    "Card 2",
    "Card 3",
    "Card 4",
    "Card 5",
  ];

  final List<String> cardImages = [
    "https://homecareassistancemontgomery.com/wp-content/uploads/2020/05/Older-Adult-in-Wheelchair.jpg",
    "https://arogincarehome.com/storage/blogs/February2022/zKdwAnY1NpqrdLrYTqNM.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL-x6SmsDLDrj7rlYeGgCNX40GmnDfE1azTA&usqp=CAU",
    "https://flc.losrios.edu/flc/main/img/News-940x529/health/mental_health_month_news.jpg"  ];
  int currentIndex = 0;
  int _selectedIndex = 0;
  int _currentIndex = 0;
  Future<void>? _launched;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Legal Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different pages based on the selected index
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Upload()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayDataScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen1()),
      );
    }
    else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => intent()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toCatch = Uri(
      scheme: 'https',
      host: 'www.helpinghands-team.org',
      path: '',
    );
    return Scaffold(
        backgroundColor:  Colors.white,
      appBar: AppBar( iconTheme: IconThemeData(color: Colors.white),title: Text('Bandhu',style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.black,),
      body: SingleChildScrollView(
        child: Column(children: [Column(children: [
          Container(

            padding: EdgeInsets.all(10),
            height: 140, // Adjust the height as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CarouselSlider(
                  items: cardImages.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: BorderSide(color: Colors.black, width: 2.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(
                              imageUrl,
                              height: 300,
                              width: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 30 / 10,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),


              ],
            ),
          ),


        SizedBox(height: 5.0),
        Text(
          "आपका अपना सहायक",
          style: TextStyle(fontSize: 16.0,color: Colors.black),
        ),
        Column(
          children: [
            Container(
              width: 300,
              height: 395,
              decoration: ShapeDecoration(
                color: Color(0xFF061E35),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFFCA311)),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Services',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // Adjust the alignment as needed
                    children: [
                      GestureDetector(
                        onTap: () {
                          //HourlyUpload
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Upload()),
                          );
                          // Handle the click event for the second container here
                          print("Container 2 clicked");
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 82,
                                height: 82,
                                color: Colors.white,
                                child: Image.asset(
                                  'assets/images/qq.png', // Replace with your image path
                                  width: 50, // Adjust the image size as needed
                                  height: 50,
                                  fit: BoxFit.cover, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Sahayta',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DisplayDataScreen()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 82,
                                height: 82,
                                color: Colors.white,
                                child: Image.asset(
                                  'assets/images/ww.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Sahayak',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyCard()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 82,
                                height: 82,
                                color: Colors.white,
                                child: Image.asset(
                                  'assets/images/shop.png', // Replace with your image path
                                  width: 60, // Adjust the image size as needed
                                  height: 60,
                                  fit: BoxFit.cover, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Shops',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // Adjust the alignment as needed
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => help()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 82,
                                height: 82,
                                color: Colors.white,
                                child: Image.asset(
                                  'assets/images/help.jpeg', // Replace with your image path
                                  width: 50, // Adjust the image size as needed
                                  height: 50,
                                  fit: BoxFit.cover, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Helpers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimerScreen()),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 82,
                              height: 79,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: CircleBorder(), // Use CircleBorder for oval shape
                              ),
                              child: Image.asset(
                                'assets/images/meditation.png', // Replace with your image path
                                width: 30, // Adjust the image size as needed
                                height: 50,
                                fit: BoxFit.fill, // You can use BoxFit to specify how the image should be fitted
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Meditation',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommunityPage()),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 82,
                              height: 79,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: CircleBorder(), // Use CircleBorder for oval shape
                              ),
                              child: Image.asset(
                                'assets/images/com.png', // Replace with your image path
                                width: 30, // Adjust the image size as needed
                                height: 50,
                                fit: BoxFit.fill, // You can use BoxFit to specify how the image should be fitted
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Community page',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // Adjust the alignment as needed
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  HomePage()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 82,
                                height: 82,
                                color: Colors.white,
                                child: Image.asset(
                                  'assets/images/bot.jpeg', // Replace with your image path
                                  width: 50, // Adjust the image size as needed
                                  height: 50,
                                  fit: BoxFit.cover, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Chatbot',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  EmergencyPage()),
                          );
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 82,
                                height: 82,
                                color: Colors.white,
                                child: Image.asset(
                                  'assets/images/eme.png', // Replace with your image path
                                  width: 50, // Adjust the image size as needed
                                  height: 50,
                                  fit: BoxFit.cover, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Emergency',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ArticlePage()),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 82,
                              height: 79,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: CircleBorder(), // Use CircleBorder for oval shape
                              ),
                              child: Image.asset(
                                'assets/images/events.png',
                                // Replace with your image path
                                width: 10, // Adjust the image size as needed
                                height: 30,
                                fit: BoxFit
                                    .fill, // You can use BoxFit to specify how the image should be fitted
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Events',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],)],
        ),
          GestureDetector(

            onTap: () => setState(() {
              _launched = _launchInWebViewOrVC(toCatch);
            },
            ),
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 5.0),
                borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
              ),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(20.0), // Same border radius as the Card
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Fhelping-logo.jpg?alt=media&token=33c6d234-09e8-47db-9605-fb989c89ed0e', // Replace with your image URL
                  fit: BoxFit.cover, // This ensures the image covers the entire card
                ),
              ),
            ),
          ),
      ]
    ),
    ),
        bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
    label: 'Home',
    backgroundColor: Color(0xffF5F5DC),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
    backgroundColor: Color(0xffF5F5DC),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
    backgroundColor: Color(0xffF5F5DC),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.chat_sharp),
    label: 'HelpingBandhu',
    backgroundColor: Color(0xffF5F5DC),
    ),
    ],
    type: BottomNavigationBarType.fixed,
    currentIndex: _selectedIndex,
    backgroundColor: Color(0xff000000),
    unselectedItemColor: Colors.white, // Set unselected item color to black
    selectedItemColor: Colors.yellow,
    iconSize: 40,
    onTap: _onItemTapped,
    elevation: 5,
    selectedLabelStyle: TextStyle(color: Colors.black), // Set selected label color to black
    unselectedLabelStyle: TextStyle(color: Colors.black), // Set unselected label color to black
    ),

    );
  }
}
Future<void> _launchInWebViewOrVC(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $url');
  }
}
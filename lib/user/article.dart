import 'package:flutter/material.dart';
class ArticlePage extends StatelessWidget {
  final List<MentalHealthCure> mentalHealthCures = [
    MentalHealthCure(
      title: 'Ganesh Chaturthi Pooja',
      description:
      'Ganesh Chaturthi puja will be held for seven days, starting from 18th September to 24th September, with ceremonies at 7:00 AM in the morning and 6:00 PM in the evening.',
    ),
    MentalHealthCure(
      title: 'Fair',
      description:
      'A fair is happening again, with many food stalls and fun rides, at City Park. ',
    ),
    MentalHealthCure(
      title: 'Republic Day',
      description:
      'Celebrating the 74th Indian Republic Day with a local parade and flag hoisting at Central Park.',
    ),

    MentalHealthCure(
      title: 'Navratri',
      description:
      'We are celebrating Navratri from October 15th to October 24th with dancing and delicious food.',
    ),
    MentalHealthCure(
      title: 'Gandhi Jayanti',
      description:
      'As we do every year on this day, we will remember and revisit the values imparted by Mahatma Gandhi, reflecting on what they teach us and how we can incorporate them into our lives, especially concerning health and personal values. Join us on October 2nd at Janta Building.',
    ),
    MentalHealthCure(
      title: 'Diwali',
      description:
      'You are all invited to the Diwali puja in our colony on November 12th. Lets come together as one big family and make this day even more Special.',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Events',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        backgroundColor: Color.fromARGB(255, 187, 255, 255),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgmed.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Local Events!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Find all the events happening near you',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'What is Events!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'All the upcoming events are updated here near you and Our mental health community is a safe and inclusive space where individuals can come together to share their experiences, seek support, and provide encouragement to one another. We believe in the power of community support and aim to create an environment that promotes understanding, empathy, and growth.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                Text(
                  'Ongoing Events',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mentalHealthCures.length,
                  itemBuilder: (context, index) {
                    final mentalHealthCure = mentalHealthCures[index];
                    return MentalHealthCureCard(
                        mentalHealthCure: mentalHealthCure);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MentalHealthCure {
  final String title;
  final String description;

  MentalHealthCure({
    required this.title,
    required this.description,
  });
}

class MentalHealthCureCard extends StatelessWidget {
  final MentalHealthCure mentalHealthCure;

  MentalHealthCureCard({required this.mentalHealthCure});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Color.fromARGB(255, 150, 209, 255),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mentalHealthCure.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Text(
              mentalHealthCure.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
class ProfileScreen1 extends StatelessWidget {
  const ProfileScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(child:Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1609252285236-93406ce15b0d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjR8fGluZGlhbiUyMGZhY2VzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60'),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', 'Rakesh Roshan', Icons.person),
              const SizedBox(height: 10),
              itemProfile('Phone', '03107085816', Icons.phone),
              const SizedBox(height: 10),
              itemProfile('Address', 'abc address, gotham city', Icons.location_city),
              const SizedBox(height: 10),
              itemProfile('Email', 'RakeshRoshan111@gmail.com', Icons.mail),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Edit Profile')
                ),
              )
            ],
          ),
          ),)
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
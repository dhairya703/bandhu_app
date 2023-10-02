import 'package:bandhu/user/usershome.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5dc),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffA9DEF9), // Your background color
              Colors.black38, // You can adjust this color as needed
            ],
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  'Bandhu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gloock',
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/logo1.jpg',
                    height: 230,
                    width: 230,
                    fit: BoxFit.cover, // Optional: This ensures the entire image is visible
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Welcome Back! Glad to see you again",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                      hintStyle: TextStyle(color: Colors.black45),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(color: Colors.black45),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Add your forgot password logic here
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xff6A707C),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Replace 'YourNextScreen' with the screen you want to navigate to
                    // Add your login logic here
                     Navigator.push(context, MaterialPageRoute(builder: (context) => usershome()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18,color: Colors.black),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    // Replace 'YourNextScreen' with the screen you want to navigate to
                    // Add your login logic here
                    Navigator.push(context, MaterialPageRoute(builder: (context) => usershome()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 17,color: Colors.black),
                  ),
                ),
                // Rest of your UI elements
              ],
            ),
          ),
        ),
      ),
    );
  }
}

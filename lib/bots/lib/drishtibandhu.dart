import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'constants/api_consts.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'providers/models_provider.dart';
import 'services/api_service.dart';
import 'widgets/chat_widget.dart';
import 'widgets/text_widget.dart';

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrishtiBandhuPage(),
    );
  }
}

class DrishtiBandhuPage extends StatefulWidget {
  @override
  State<DrishtiBandhuPage> createState() => _DrishtiBandhuPageState();
}

class _DrishtiBandhuPageState extends State<DrishtiBandhuPage> {
  TextEditingController inputText = TextEditingController();
  String apikey = 'tsk-nTRcf1113XPQht7r22T3Bvadapavlb5kFJYz1yz5b4xifuyzpoiyom2ooNIQehy';
  String url = 'https://api.openai.com/v1/images/generations';
  String? image;
  bool isLoading = false; // Added loading indicator

  void getAIImage() async {
    if (inputText.text.isNotEmpty) {
      setState(() {
        isLoading = true; // Show loading indicator
      });

      var data = {
        "prompt": inputText.text,
        "n": 1,
        "size": "256x256",
      };

      var res = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $API_KEY",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data),
      );

      var jsonResponse = jsonDecode(res.body);

      image = jsonResponse['data'][0]['url'];
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    } else {
      print("Enter something");
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xffF5F5DC);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Open AI DALL.E"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isLoading
                ? CircularProgressIndicator() // Show loading indicator
                : image != null
                ? Image.network(image!, width: 256, height: 265)
                : Container(child: Text("Please Enter Text To Generate AI image")),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: inputText,
                onSubmitted: (_) {
                  getAIImage();
                },
                decoration: InputDecoration(
                  hintText: "Enter Text to Generate AI Image",
                  filled: true,
                  fillColor: Colors.blue.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      getAIImage();
                    },
                    icon: Icon(Icons.search), // Replace with your desired icon
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
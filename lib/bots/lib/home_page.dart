
import 'package:animate_do/animate_do.dart';

import 'package:bandhu/bots/lib/openai_service.dart';
import 'package:bandhu/bots/lib/pallete.dart';
import 'package:bandhu/bots/lib/screens/textbandhu.dart';
import 'package:bandhu/bots/lib/vaanibandhu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:permission_handler/permission_handler.dart';

import 'drishtibandhu.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import 'feature_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    setState(() {
      // Show a "Listening" dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Listening...'),
            content: CircularProgressIndicator(),
            // You can use a loading indicator here
            actions: <Widget>[
              TextButton( // Use TextButton instead of FlatButton
                child: Text('Stop Listening'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  stopListening(); // Stop listening when the user presses the button
                },
              ),
            ],
          );
        },
      );
    });

    // await speechToText.listen(onResult: onSpeechResult);
    var status = await Permission.microphone.status;

    if (status.isGranted) {
      // Microphone permission is already granted, start listening
      await speechToText.listen(onResult: onSpeechResult);
    } else {
      // Microphone permission is not granted, request it
      status = await Permission.microphone.request();

      if (status.isGranted) {
        // Permission granted, start listening
        await speechToText.listen(onResult: onSpeechResult);
      } else {
        // Permission denied
        // You can handle this case, e.g., show an error message
      }
    }

    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    // Check if the microphone permission is granted

    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xff660033);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xff660033),
        title: BounceInDown(
          child: const Text(
            'Bandhu Bot',
            style: TextStyle(
              color: Color(0xffFFD700),
            ),
          ),
        ),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // virtual assistant picture
            ZoomIn(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top: 4),
                      decoration: const BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    height: 123,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/lawyer.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // chat bubble
            FadeInRight(
              child: Visibility(
                visible: generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Pallete.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(20).copyWith(
                      topLeft: Radius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      generatedContent == null
                          ? 'Bandhu Bot at your service, how may I help you?'
                          : generatedContent!,
                      style: TextStyle(
                        fontFamily: 'Cera Pro',
                        color: Color(0xffFFD700),
                        fontSize: generatedContent == null ? 25 : 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (generatedImageUrl != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(generatedImageUrl!),
                ),
              ),
            SlideInLeft(
              child: Visibility(
                visible: generatedContent == null && generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, left: 22),
                  child: const Text(
                    'Choose the feature you would like to access',
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      color: Color(0xffFFD700),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // features list
            Visibility(
              visible: generatedContent == null && generatedImageUrl == null,
              child: Column(
                children: [
                  SlideInLeft(
                    delay: Duration(milliseconds: start),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(), // Replace with the actual destination page
                        ));
                      },
                      child: const FeatureBox(
                        color: Pallete.firstSuggestionBoxColor,
                        headerText: 'TextBandhu',
                        descriptionText:
                        'Get all your general legal queries answered with TextBandhu',
                      ),
                    ),),

                  SlideInLeft(


                    delay: Duration(milliseconds: start + delay),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DrishtiBandhuPage(), // Use the TextBandhuPage class
                        ));
                      },
                      child: const FeatureBox(
                        color: Pallete.secondSuggestionBoxColor,
                        headerText: 'DrishtiBandhu',
                        descriptionText:
                        'Generate from templates to sketches with the power of Drishti ',
                      ),
                    ),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + 2 * delay),

                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              VaaniBandhuPage(), // Use the TextBandhuPage class
                        ));
                      },
                      child: const FeatureBox(
                        color: Pallete.thirdSuggestionBoxColor,
                        headerText: 'Vaani Bandhu',
                        descriptionText:
                        'Let speech express your thoughts and Vaani analyse them',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ZoomIn(
        delay: Duration(milliseconds: start + 3 * delay),
        child: FloatingActionButton(
          backgroundColor: Color(0xffFFD700),
          onPressed: () async {
            if (await speechToText.hasPermission &&
                speechToText.isNotListening) {
              await startListening();
            } else if (speechToText.isListening) {
              final speech = await openAIService.isArtPromptAPI(lastWords);
              if (speech.contains('https')) {
                generatedImageUrl = speech;
                generatedContent = null;
                setState(() {});
              } else {
                generatedImageUrl = null;
                generatedContent = speech;
                setState(() {});
                await systemSpeak(speech);
              }
              await stopListening();
            } else {
              initSpeechToText();
            }
          },
          child: Icon(
            speechToText.isListening ? Icons.stop : Icons.mic,
          ),
        ),
      ),
    );
  }
}


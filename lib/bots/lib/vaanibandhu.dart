import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'constants/api_consts.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'constants/api_consts.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class VaaniBandhuPage extends StatefulWidget {
  @override
  _VaaniBandhuPageState createState() => _VaaniBandhuPageState();
}

class _VaaniBandhuPageState extends State<VaaniBandhuPage> {
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  bool _isListening = false;
  String _lastWords = '';
  String _gptResponse = '';
  DateTime? _lastRequestTime; // To track the time of the last API request

  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    initTextToSpeech();
    _videoController = VideoPlayerController.asset('assets/videos/Modiji.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown
        setState(() {});
        _videoController.play(); // Start playing the video
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  Future<void> initTextToSpeech() async {
    await _flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> startListening() async {
    setState(() {
      _isListening = true;
    });

    var status = await Permission.microphone.status;

    if (status.isGranted) {
      _speechToText.listen(onResult: onSpeechResult);
    } else {
      status = await Permission.microphone.request();

      if (status.isGranted) {
        _speechToText.listen(onResult: onSpeechResult);
      } else {
        // Handle permission denied
      }
    }
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });
  }

  void onSpeechResult(SpeechRecognitionResult result) async {
    setState(() {
      _lastWords = result.recognizedWords;
    });

    // Implement rate limiting: Check if enough time has passed since the last request
    if (_lastRequestTime == null || DateTime.now().difference(_lastRequestTime!) > Duration(seconds: 20)) {
      // Send the recognized text to GPT-3 using the OpenAI API (davinci-002 model)
      final gptResponse = await sendToOpenAI(result.recognizedWords);

      // Update the state with the GPT-3 response and set the last request time
      setState(() {
        _gptResponse = gptResponse;
        _lastRequestTime = DateTime.now();
      });
    } else {
      // Implement rate limiting: Show a message if a request is made too soon
      print('Rate limit exceeded. Please wait before making another request.');
    }
  }

  Future<String> sendToOpenAI(String text) async {
    final openaiUrl = Uri.parse('https://api.openai.com/v1/engines/davinci-002/completions');
    final response = await http.post(
      openaiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $API_KEY', // Replace with your OpenAI API key
      },
      body: jsonEncode({
        'prompt': text,
        'max_tokens': 50, // Adjust as needed
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['choices'][0]['text'];
    } else {
      // Handle error
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return 'Failed to get a response from GPT-3';
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xffF5F5DC);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Vaani Bandhu'),
      ),
      body: Column(
        children: [
          // Video at the top
          if (_videoController.value.isInitialized)
            AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            ),
          // Bottom section with Listening and GPT-3 Response
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_lastWords, style: TextStyle(fontFamily: 'Roboto')),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_isListening) {
                        await stopListening();
                      } else {
                        await startListening();
                      }
                    },
                    child: Text(_isListening ? 'Stop Listening' : 'Start Listening'),
                  ),
                  SizedBox(height: 20),
                  Text('GPT-3 Response:'),
                  Text(_gptResponse),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

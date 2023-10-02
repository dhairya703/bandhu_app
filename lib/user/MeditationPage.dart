import 'dart:async';

import 'package:bandhu/user/animation.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration;
  late bool _isRunning;
  late int _elapsedSeconds;
  late String _formattedTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _duration = Duration(minutes: 2);
    _isRunning = false;
    _elapsedSeconds = _duration.inSeconds;
    _formattedTime = _formatDuration(_duration);
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_elapsedSeconds > 0) {
        setState(() {
          _elapsedSeconds--;
          _formattedTime = _formatDuration(Duration(seconds: _elapsedSeconds));
        });
      } else {
        timer.cancel();
        setState(() {
          _isRunning = false;
        });
      }
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      _isRunning = false;
      _elapsedSeconds = _duration.inSeconds;
      _formattedTime = _formatDuration(_duration);
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meditation',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 255, 117, 5),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 117, 5),
              Color.fromARGB(255, 255, 117, 5),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 150,
              // ),
              Image.asset('assets/images/yogaboy.png'),
              BreatheAnimation(),
              SizedBox(
                height: 100,
              ),
              Text(
                _formattedTime,
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(Icons.play_circle_rounded, size: 40),
                      onPressed: _isRunning ? null : _startTimer),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      icon: Icon(Icons.stop_circle_rounded, size: 40),
                      onPressed: _isRunning ? _stopTimer : null),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:detect_testflight/detect_testflight.dart';

void main() {
  runApp(DetectTestFlightTestApp());
}

class DetectTestFlightTestApp extends StatefulWidget {
  @override
  _DetectTestFlightTestAppState createState() => _DetectTestFlightTestAppState();
}

class _DetectTestFlightTestAppState extends State<DetectTestFlightTestApp> {
  bool _isTF;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool isTF;
    try {
      isTF = await DetectTestflight.isTestflight;
    } on PlatformException {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isTF = isTF;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Am I in Testflight?'),
        ),
        body: Center(
          child: Text(
            'Is TF? ${_isTF == true ? "Yes" : (_isTF != null ? "No" : "IDK")}'
          ),
        ),
      ),
    );
  }
}

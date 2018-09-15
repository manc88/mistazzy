import 'package:flutter/material.dart';

void main() => runApp(new MistazzyApp());

class MistazzyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "mistazyy",
      home: Scaffold(
        appBar: AppBar(
          title: Text("mistazzy"),
        ),
      ),
    );
  }
}

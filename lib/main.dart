import 'package:flutter/material.dart';
import 'package:mistazzy/widgets/topicList.dart';

import 'package:flutter/rendering.dart';

void main() {
  debugPaintBaselinesEnabled = true;
  debugPaintSizeEnabled = true;
  runApp(new MistazzyApp());
}

class MistazzyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "mistazyy",
      home: Scaffold(
        appBar: AppBar(
          title: Text("mistazzy"),
        ),
        body: TopicList(),
      ),
    );
  }
}

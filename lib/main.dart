import 'package:flutter/material.dart';
import 'package:mistazzy/nav/topicListPage.dart';

import 'package:flutter/rendering.dart'
    show
        debugPaintSizeEnabled,
        debugPaintBaselinesEnabled,
        debugPaintLayerBordersEnabled,
        debugPaintPointersEnabled,
        debugRepaintRainbowEnabled;

void main() {
  runApp(new MistazzyApp());
}

class MistazzyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPaintBaselinesEnabled = true;
    // debugPaintBaselinesEnabled = true;
    // debugPaintLayerBordersEnabled = true;
    //     debugPaintPointersEnabled = true;
    //     debugRepaintRainbowEnabled = true;

    return MaterialApp(
      title: "mistazyy",
      home: TopicListPage(),
    );
  }
}

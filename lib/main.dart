import 'package:flutter/material.dart';
import 'package:mistazzy/nav/routes.dart';
import 'package:mistazzy/nav/topicListPage.dart';

// import 'package:flutter/rendering.dart'
//     show
//         debugPaintSizeEnabled,
//         debugPaintBaselinesEnabled,
//         debugPaintLayerBordersEnabled,
//         debugPaintPointersEnabled,
//         debugRepaintRainbowEnabled;
import 'package:mistazzy/utils/Strings.dart';

void main() {
  //debugPaintBaselinesEnabled = true;
  //debugPaintBaselinesEnabled = true;
  runApp(new MistazzyApp());
}

class MistazzyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPaintBaselinesEnabled = true;
    // debugPaintBaselinesEnabled = true;
    // debugPaintLayerBordersEnabled = true;
    //     debugPaintPointersEnabled = true;
    //     debugRepaintRainbowEnabled = true;

    return MaterialApp(
      theme: ThemeData(
          primaryTextTheme: TextTheme(title: TextStyle(fontSize: 26.0))),
      title: Strings.appName,
      home: TopicListPage(),
      routes: appRoutes,
    );
  }
}

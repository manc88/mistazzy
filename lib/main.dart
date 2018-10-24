import 'package:flutter/material.dart';
import 'package:mistazzy/nav/routes.dart';
import 'package:mistazzy/nav/topicListPage.dart';
import 'package:mistazzy/utils/Strings.dart';

void main() {
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
          primaryColor: Colors.blueGrey,
          accentColor: Colors.blue,
          textTheme: TextTheme(
            display1: TextStyle(color: Colors.grey, fontSize: 16.0),
            display2: TextStyle(color: Colors.blueGrey, fontSize: 16.0),
            display3: TextStyle(color: Colors.black, fontSize: 16.0),
            display4: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
          primaryTextTheme: TextTheme(title: TextStyle(fontSize: 26.0))),
      title: Strings.appName,
      home: TopicListPage(),
      routes: appRoutes,
    );
  }
}

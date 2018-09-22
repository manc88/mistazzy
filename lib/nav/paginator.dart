import 'package:flutter/material.dart';
import 'package:mistazzy/nav/topicPage.dart';

class Paginator {
  static void pop(BuildContext cnt) {
    Navigator.pop(cnt);
  }

  static void goToTopic(BuildContext cnt) {
    Navigator.push(
        cnt, MaterialPageRoute(builder: (BuildContext cont) => TopicPage()));
  }
}

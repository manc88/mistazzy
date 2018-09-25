import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/nav/loginPage.dart';
import 'package:mistazzy/nav/topicPage.dart';

class Paginator {
  static void pop(BuildContext cnt) {
    Navigator.pop(cnt);
  }

  static void goToTopic(BuildContext cnt, Topic topic) {
    Navigator.push(cnt,
        MaterialPageRoute(builder: (BuildContext cont) => TopicPage(topic)));
  }

  static void goToLogin(BuildContext cnt) {
    Navigator.push(
        cnt, MaterialPageRoute(builder: (BuildContext cont) => LoginPage()));
  }
}

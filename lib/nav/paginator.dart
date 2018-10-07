import 'package:flutter/material.dart';
import 'package:mistazzy/models/topic.dart';
import 'package:mistazzy/nav/commentsPage.dart';
import 'package:mistazzy/nav/loginPage.dart';
import 'package:mistazzy/nav/topicListPage.dart';
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

  static void goToTopicComments(BuildContext cnt, Topic topic) {
    Navigator.push(cnt,
        MaterialPageRoute(builder: (BuildContext cont) => CommentsPage(topic)));
  }

  static void goToTopicsList(BuildContext cnt) {
    Navigator.push(cnt,
        MaterialPageRoute(builder: (BuildContext cont) => TopicListPage()));
  }
}

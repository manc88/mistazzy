import 'package:flutter/material.dart';
import '../widgets/topicList.dart';

class TopicListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mistazzy"),
      ),
      body: TopicList(),
    );
  }
}
